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

package energy.usef.brp.model;

import org.junit.Assert;
import org.junit.Test;

/**
 * 
 */
public class SynchronisationConnectionTest {

    @Test
    public void testFindStatusForCRO() {
        SynchronisationConnection connection = new SynchronisationConnection();
        Assert.assertNull(connection.findStatusForCRO("cro.dummy.nl"));

        SynchronisationConnectionStatus status = new SynchronisationConnectionStatus();
        status.setStatus(SynchronisationConnectionStatusType.MODIFIED);
        CommonReferenceOperator commonReferenceOperator = new CommonReferenceOperator();
        commonReferenceOperator.setDomain("cro.dummy.nl");
        status.setCommonReferenceOperator(commonReferenceOperator);
        connection.getStatusses().add(status);

        Assert.assertNull(connection.findStatusForCRO("cro.non.nl"));

        Assert.assertNotNull(connection.findStatusForCRO("cro.dummy.nl"));
        Assert.assertEquals(SynchronisationConnectionStatusType.MODIFIED, connection.findStatusForCRO("cro.dummy.nl"));
    }

}
