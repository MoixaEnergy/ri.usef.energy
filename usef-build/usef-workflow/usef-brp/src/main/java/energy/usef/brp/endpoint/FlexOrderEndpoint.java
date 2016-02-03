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

package energy.usef.brp.endpoint;

import energy.usef.brp.workflow.plan.flexorder.place.FlexOrderEvent;

import javax.enterprise.event.Event;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Restful service designed to trigger the Flex Order workflow.
 */
@Path("/FlexOrderEvent")
public class FlexOrderEndpoint {
    private static final Logger LOGGER = LoggerFactory.getLogger(FlexOrderEndpoint.class);

    @Inject
    private Event<FlexOrderEvent> flexOrderEventManager;

    /**
     * Fires a new FlexOrderEvent.
     * <p>URL: /FlexOrderEvent</p>
     * 
     * @return a HTTP {@link Response}.
     */
    @GET
    public Response sendFlexOrderEvent() {
        LOGGER.info("FlexOrderEvent fired.");
        flexOrderEventManager.fire(new FlexOrderEvent());
        return Response.status(Response.Status.OK).build();
    }

}
