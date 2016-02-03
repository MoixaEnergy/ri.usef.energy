/*
 * Copyright 2015 USEF Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package energy.usef.agr.dto.device.capability;

import java.util.ArrayList;
import java.util.List;

/**
 * JSON Object to have a list of profiles.
 */
public class ProfileDto {

    private List<DeviceCapabilityDto> capabilities;

    public List<DeviceCapabilityDto> getCapabilities() {
        if(capabilities == null) {
            capabilities = new ArrayList<>();
        }
        return capabilities;
    }

    public void setCapabilities(List<DeviceCapabilityDto> capabilities) {
        this.capabilities = capabilities;
    }
}
