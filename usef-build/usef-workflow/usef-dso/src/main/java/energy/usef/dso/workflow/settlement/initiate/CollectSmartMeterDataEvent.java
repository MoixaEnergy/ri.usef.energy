/*
 * Copyright 2015-2016 USEF Foundation
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

package energy.usef.dso.workflow.settlement.initiate;

import org.joda.time.LocalDate;

/**
 * Event implementation for the Initiate Settlement workflow.
 */
public class CollectSmartMeterDataEvent {
    private LocalDate periodInMonth;

    public LocalDate getPeriodInMonth() {
        return periodInMonth;
    }

    public void setPeriodInMonth(LocalDate periodInMonth) {
        this.periodInMonth = periodInMonth;
    }

    @Override
    public String toString() {
        return "CollectSmartMeterDataEvent" + "[" +
                "periodInMonth=" + periodInMonth +
                "]";
    }
}
