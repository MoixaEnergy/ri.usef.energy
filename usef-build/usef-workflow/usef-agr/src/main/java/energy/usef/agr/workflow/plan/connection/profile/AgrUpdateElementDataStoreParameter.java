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

package energy.usef.agr.workflow.plan.connection.profile;

/**
 * This class contains the enumerations of possible parameters for the workflow to update the element data store.
 */
public class AgrUpdateElementDataStoreParameter {

    /**
     * Input parameters.
     */
    public enum IN {
        PERIOD,
        PTU_DURATION,
        CONNECTION_PORTFOLIO_LIST
    }

    /**
     * Output parameters.
     */
    public enum OUT {
        ELEMENT_LIST
    }

}
