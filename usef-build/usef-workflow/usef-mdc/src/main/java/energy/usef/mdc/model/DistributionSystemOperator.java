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

package energy.usef.mdc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Entity class {@link DistributionSystemOperator}: This class is a representation of a DistributionSystemOperator for the CRO role.
 */
@Entity
@Table(name = "DISTRIBUTION_SYSTEM_OPERATOR")
public class DistributionSystemOperator {

    @Id
    @Column(name = "DSO_DOMAIN", unique = true, nullable = false)
    private String domain;

    /**
     * Construct a default {@link DistributionSystemOperator}.
     */
    public DistributionSystemOperator() {

    }

    /**
     * Construct a default {@link DistributionSystemOperator} with the specified domain.
     *
     * @param domain
     */
    public DistributionSystemOperator(String domain) {
        this.domain = domain;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    @Override
    public String toString() {
        return "DistributionSystemOperator [domain=" + domain + "]";
    }

}
