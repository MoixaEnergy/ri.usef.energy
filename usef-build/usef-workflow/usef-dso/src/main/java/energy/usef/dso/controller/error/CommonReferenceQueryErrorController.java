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

package energy.usef.dso.controller.error;

import energy.usef.core.controller.error.BaseOutgoingErrorMessageController;
import energy.usef.core.data.xml.bean.message.CommonReferenceQuery;
import energy.usef.dso.workflow.plan.connection.forecast.CreateConnectionForecastEvent;

import javax.ejb.Stateless;
import javax.enterprise.event.Event;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Processes common reference query not sent message.
 */
@Stateless
public class CommonReferenceQueryErrorController extends BaseOutgoingErrorMessageController<CommonReferenceQuery> {
    private static final Logger LOGGER = LoggerFactory.getLogger(CommonReferenceQueryErrorController.class);

    @Inject
    private Event<CreateConnectionForecastEvent> eventManager;

    /**
     * {@inheritDoc}
     */
    public void execute(CommonReferenceQuery message) {
        LOGGER.info("Start processing not sent CommonReferenceQuery message.");
        eventManager.fire(new CreateConnectionForecastEvent());
    }

}
