/*
 * Copyright (c) 2014-2016 BePowered BVBA http://www.bepowered.be/
 *
 * Software is subject to the following conditions:
 *
 * The above copyright notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package nl.energieprojecthoogdalem.forecastservice.weather;

import info.usef.core.config.AbstractConfig;
import info.usef.core.util.PtuUtil;
import nl.energieprojecthoogdalem.configurationservice.AgrConfiguration;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.io.FileInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.stream.Collectors;

/**
 * a weather forecast correction service
 * */
public class WeatherService
{
    private static final Logger LOGGER = LoggerFactory.getLogger(WeatherService.class);
    public static final double DEFAULT_DAY_FORECAST_VALUE = 1D;
    private static final String HOURLY_FORECAST = "hourly_forecast";
    private final Properties properties;

    public WeatherService(Properties properties)
    {
        this.properties = properties;
        //properties = AgrConfiguration.getConfig(pcbName, period, ptuDuration);
    }

    /**
     * get a correction factor for all quarter ptus determined by a correction factor of each hour ptu,
     * the json is generated by the wunderground "hourly10day" api
     * request can be redirected to a weather.json file under the configuration folder
     *
     * uses the {@link HourlyForecast} POJO to convert the json
     * uses the following formula per ptu: 1 - 0.9 * SKY / 100 where SKY is a value fom the json, for each hour
     *
     * reads the weather.properties from the configuration file
     *
     * required properties:
     * "use_file" true if you want to use the weather.json file (defaults to false)
     * "url" the url to request a json file from (no default)
     *
     * */
    public Map<Integer, Double> getDayCorrection(LocalDate period, int ptuDuration)
    {
        Map<Integer, Double> correctionPerPtu;
        int ptuCount = PtuUtil.getNumberOfPtusPerDay(period, ptuDuration);

        try
        {
            final LocalDate date;
            ObjectMapper objectMapper = new ObjectMapper();
            InputStream jsonStream;
            URL requestUrl;
            HttpURLConnection con = null;

            Boolean useFile = Boolean.parseBoolean(properties.getProperty(AgrConfiguration.USE_WUNDERGROUND_FILE));
            if( ! useFile  )
            {
                date = period;

                requestUrl = new URL(properties.getProperty(AgrConfiguration.WUNDERGROUND_URL));
                con = (HttpURLConnection) requestUrl.openConnection();

                if(con.getResponseCode() == HttpURLConnection.HTTP_OK)
                    jsonStream = con.getInputStream();

                else
                {
                    jsonStream = null;
                    LOGGER.warn("Unable to request wunderground api with HTTP status message {} {}",con.getResponseCode(), con.getResponseMessage());
                }
            }
            else
            {
                jsonStream = new FileInputStream(AbstractConfig.getConfigurationFolder() + "weather.json");
                date = new LocalDate(properties.getProperty(AgrConfiguration.WUNDERGROUND_FILE_PERIOD));
            }

            JsonNode root = objectMapper.readTree(jsonStream);
            if(!useFile)
                con.disconnect();

            root = root.get(HOURLY_FORECAST);
            HourlyForecast[] hourlyForecasts = objectMapper.convertValue(root, HourlyForecast[].class);

            correctionPerPtu = Arrays.stream(hourlyForecasts)
                                     .filter(hourlyForecast -> date.compareTo(hourlyForecast.getDateTime().toLocalDate()) == 0)
                                     .collect(Collectors.toMap(hf -> hf.getPtuIndex(ptuDuration), hf-> hf.getSkyCorrectionFactor(Double.parseDouble(properties.getProperty(AgrConfiguration.SKY_IRRADIATE)))));

            //correction only available for hours, fill every quarter slot with hour values
            for(int ptuIndex = 1; ptuIndex <= ptuCount; ptuIndex += 4 )
            {
                Double hourVal = correctionPerPtu.get(ptuIndex);

                for(int quarterIndex = 0; quarterIndex < (60 / ptuDuration); quarterIndex++)
                {
                    LOGGER.trace("filling idx {} with {} ",ptuIndex + quarterIndex, (hourVal != null ) ? hourVal : DEFAULT_DAY_FORECAST_VALUE);
                    correctionPerPtu.put( ptuIndex + quarterIndex
                            ,(hourVal != null) ? hourVal : DEFAULT_DAY_FORECAST_VALUE
                    );
                }
            }

        }
        catch(NullPointerException | EOFException | IllegalStateException | IllegalArgumentException exception)
        {
            LOGGER.error("Unable to parse weather forecast json reason: ", exception);
            correctionPerPtu = defaultDayCorrection(ptuCount);
        }
        catch(MalformedURLException exception)
        {
            LOGGER.error("Unable to parse weather URL reason: ", exception);
            correctionPerPtu = defaultDayCorrection(ptuCount);
        }
        catch(IOException exception)
        {
            LOGGER.error("Unable to get weather forecast reason: ", exception);
            correctionPerPtu = defaultDayCorrection(ptuCount);
        }

        return correctionPerPtu;
    }

    /**
     * returns a map with the default correction factor value 1
     * @param ptuCount the total number of ptus
     * @return a map using ptu indexes as a Integer key and DEFAULT_DAY_FORECAST_VALUE as a Double value
     * */
    private Map<Integer, Double> defaultDayCorrection(int ptuCount)
    {
        Map<Integer, Double> defaultCorrectionMap = new HashMap<>();
        LOGGER.warn("Using default weather forecast values");

        for(int idx = 1; idx <= ptuCount; defaultCorrectionMap.put(idx++, DEFAULT_DAY_FORECAST_VALUE));

        return defaultCorrectionMap;
    }

    public double getWeatherCorrection()
    {
        double correctionFactor = 0.2D;
        try
        {
            URL requestUrl = new URL("http://api.wunderground.com/api/70590ef7d1415c6f/forecast/q/Gorinchem.json");
            HttpURLConnection con = (HttpURLConnection) requestUrl.openConnection();
            if(con.getResponseCode() == HttpURLConnection.HTTP_OK)
            {
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode root = objectMapper.readTree(con.getInputStream());
                con.disconnect();
                String forecastName = root
                        .get("forecast")
                        .get("simpleforecast")
                        .get("forecastday")
                        .get(1) // object of array where period = 2
                        .get("icon")
                        .asText();

                switch (forecastName) {
                    case "clear":
                        correctionFactor = 1D;
                        break;

                    case "partlycloudy":
                        correctionFactor = 0.6D;
                        break;

                    case "mostlycloudy":
                        correctionFactor = 0.4D;
                        break;

                    case "chancerain":
                        correctionFactor = 0.3D;
                        break;
                /*
                    default:
                    case "rain":
                        correctionFactor = 0.2D;
                */
                }

                LOGGER.info("Weather correction forecast name is {}, value becomes {}", forecastName, correctionFactor);
            }
            else
                LOGGER.warn("Unable to request wunderground api with HTTP status message {} {}",con.getResponseCode(), con.getResponseMessage());

        }
        catch (MalformedURLException exception)
        {
            LOGGER.error("Malformed request url, using {} as weather forecast correction factor, reason: ",correctionFactor ,exception);
        }
        catch (IOException exception)
        {
            LOGGER.error("IO exception while requesting weather forecast using {} as correction factor, reason: ",correctionFactor ,exception);
        }
        catch (NullPointerException exception)
        {
            LOGGER.error("weather forecast name probably not found using correction factor {}, reason: ",correctionFactor ,exception);
        }

        return correctionFactor;
    }
}