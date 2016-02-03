--
-- Copyright 2015 USEF Foundation
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http\://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--


INSERT INTO SYNCHRONISATION_CONGESTION_POINT (ID, ENTITY_ADDRESS, LAST_SYNCHRONISATION_TIME, LAST_MODIFICATION_TIME) VALUES (1, 'ea1.1234-1234-1231241', '2015-01-21 01:02:03', '2015-01-20 01:02:03');
INSERT INTO SYNCHRONISATION_CONGESTION_POINT (ID, ENTITY_ADDRESS, LAST_SYNCHRONISATION_TIME, LAST_MODIFICATION_TIME) VALUES (2, 'ea1.1234-1234-1231242', '2015-01-21 01:02:03', '2015-01-20 01:02:03');

INSERT INTO SYNCHRONISATION_CONNECTION (ID, ENTITY_ADDRESS, SYNCHRONISATION_CONGESTION_POINT_ID) VALUES (1, 'ean.871685900012636543', 1);
INSERT INTO SYNCHRONISATION_CONNECTION (ID, ENTITY_ADDRESS, SYNCHRONISATION_CONGESTION_POINT_ID) VALUES (2, 'ean.121685900012636999', 2);

INSERT INTO COMMON_REFERENCE_OPERATOR (ID,DOMAIN) VALUES(1,'usef-example.com');
INSERT INTO COMMON_REFERENCE_OPERATOR (ID,DOMAIN) VALUES(2,'usef-demo.com');
INSERT INTO COMMON_REFERENCE_OPERATOR (ID,DOMAIN) VALUES(3,'status-demo.com');

INSERT INTO METER_DATA_COMPANY (DOMAIN) VALUES('mdc.usef-example.com');

INSERT INTO SYNCHRONISATION_CONGESTION_POINT_STATUS (ID, SYNCHRONISATION_CONGESTION_POINT_ID, COMMON_REFERENCE_OPERATOR_ID, SYNCHRONISATION_CONGESTION_POINT_STATUS) VALUES (1, 1, 1, 'MODIFIED');
INSERT INTO SYNCHRONISATION_CONGESTION_POINT_STATUS (ID, SYNCHRONISATION_CONGESTION_POINT_ID, COMMON_REFERENCE_OPERATOR_ID, SYNCHRONISATION_CONGESTION_POINT_STATUS) VALUES (2, 1, 2, 'MODIFIED');
INSERT INTO SYNCHRONISATION_CONGESTION_POINT_STATUS (ID, SYNCHRONISATION_CONGESTION_POINT_ID, COMMON_REFERENCE_OPERATOR_ID, SYNCHRONISATION_CONGESTION_POINT_STATUS) VALUES (3, 2, 1, 'SYNCHRONIZED');
INSERT INTO SYNCHRONISATION_CONGESTION_POINT_STATUS (ID, SYNCHRONISATION_CONGESTION_POINT_ID, COMMON_REFERENCE_OPERATOR_ID, SYNCHRONISATION_CONGESTION_POINT_STATUS) VALUES (4, 2, 2, 'SYNCHRONIZED');
INSERT INTO SYNCHRONISATION_CONGESTION_POINT_STATUS (ID, SYNCHRONISATION_CONGESTION_POINT_ID, COMMON_REFERENCE_OPERATOR_ID, SYNCHRONISATION_CONGESTION_POINT_STATUS) VALUES (5, 1, 3, 'MODIFIED');
INSERT INTO SYNCHRONISATION_CONGESTION_POINT_STATUS (ID, SYNCHRONISATION_CONGESTION_POINT_ID, COMMON_REFERENCE_OPERATOR_ID, SYNCHRONISATION_CONGESTION_POINT_STATUS) VALUES (6, 2, 3, 'MODIFIED');

INSERT INTO MESSAGE (ID,CONTENT_HASH,CONVERSATION_ID,CREATION_TIME,DIRECTION,MESSAGE_ID,MESSAGE_TYPE,RECEIVER,SENDER,XML) VALUES (1, '3979338f0693dc019f39f5b081ba12fd7fc0f125f2bf39430912d7e444f6f123', '0678bc1b-2cac-4305-aae3-02f9ad1f3452', '2014-11-20', 'INBOUND', '9594c3f7-fb9a-4425-a514-d32ff902a218', 'ROUTINE', 'usef-example.com', 'usef-example.com', '<xml></xml>');

INSERT INTO PTU_CONTAINER (ID, PHASE, PTU_DATE, PTU_INDEX) VALUES (1, 'Plan',  '2014-11-20', 1);
INSERT INTO PTU_CONTAINER (ID, PHASE, PTU_DATE, PTU_INDEX) VALUES (2, 'Plan',  '2014-11-20', 2);
INSERT INTO PTU_CONTAINER (ID, PHASE, PTU_DATE, PTU_INDEX) VALUES (3, 'Plan',  '2014-11-20', 3);
INSERT INTO PTU_CONTAINER (ID, PHASE, PTU_DATE, PTU_INDEX) VALUES (4, 'Settlement',  '2014-11-19', 1);
INSERT INTO PTU_CONTAINER (ID, PHASE, PTU_DATE, PTU_INDEX) VALUES (5, 'Settlement',  '2014-10-19', 1);

INSERT INTO CONNECTION_GROUP(USEF_IDENTIFIER, CONNECTION_GROUP_TYPE, DSO_DOMAIN, BRP_DOMAIN) VALUES('ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7','CONGESTION_POINT','dso.usef-example.com',NULL);
INSERT INTO CONNECTION_GROUP(USEF_IDENTIFIER, CONNECTION_GROUP_TYPE, DSO_DOMAIN, BRP_DOMAIN) VALUES('ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e8','CONGESTION_POINT','dso.usef-example.com',NULL);


INSERT INTO CONNECTION (ENTITY_ADDRESS) VALUES ('ancx.com');
INSERT INTO CONNECTION (ENTITY_ADDRESS) VALUES ('qbcy.com');

INSERT INTO CONNECTION_METER_EVENT(ID, CONNECTION, EVENT_TYPE, DATETIME, CAPACITY ) VALUES( 1, 'ancx.com', 'CapacityManagement', '2015-01-01 10:00:00.000', 1000);
INSERT INTO CONNECTION_METER_EVENT(ID, CONNECTION, EVENT_TYPE, DATETIME ) VALUES( 2, 'ancx.com', 'ConnectionInterruption', '2015-01-31 23:59:59.999');
INSERT INTO CONNECTION_METER_EVENT(ID, CONNECTION, EVENT_TYPE, DATETIME, CAPACITY ) VALUES( 3, 'ancx.com', 'ConnectionResumption', '2015-02-01 10:00:00.000', 1000);

INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID, CONNECTION_GROUP_ID) VALUES (1, 20141126110000456, 1,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID, CONNECTION_GROUP_ID) VALUES (2, 20141126110000458, 3,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID, CONNECTION_GROUP_ID) VALUES (3, 20141126110000457, 3,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID, CONNECTION_GROUP_ID) VALUES (4, 20141126110000459, 1,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID, CONNECTION_GROUP_ID) VALUES (5, 20141126110000460, 1,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');

INSERT INTO NON_AGGREGATOR_FORECAST (MAX_LOAD, POWER, ID, CREATION_DATE) VALUES (10, 10, 1, '2015-02-11 10:00:00.000');
INSERT INTO NON_AGGREGATOR_FORECAST (MAX_LOAD, POWER, ID, CREATION_DATE) VALUES (15, 15, 2, '2015-02-11 10:10:00.000');
INSERT INTO NON_AGGREGATOR_FORECAST (MAX_LOAD, POWER, ID, CREATION_DATE) VALUES (20, 20, 3, '2015-02-11 10:20:00.000');
INSERT INTO NON_AGGREGATOR_FORECAST (MAX_LOAD, POWER, ID, CREATION_DATE) VALUES (11, 11, 4, '2015-02-11 10:30:00.000');
INSERT INTO NON_AGGREGATOR_FORECAST (MAX_LOAD, POWER, ID, CREATION_DATE) VALUES (20, 20, 5, '2015-02-11 10:40:00.000');

INSERT INTO AGGREGATOR (DOMAIN) VALUES ('agr1.usef-example.com');
INSERT INTO AGGREGATOR (DOMAIN) VALUES ('agr2.usef-example.com');
INSERT INTO AGGREGATOR (DOMAIN) VALUES ('agr3.usef-example.com');
INSERT INTO AGGREGATOR (DOMAIN) VALUES ('agr4.usef-example.com');

INSERT INTO CONNECTION_GROUP_STATE (ID, CONNECTION_ID, CONNECTION_GROUP_ID, VALID_FROM, VALID_UNTIL) VALUES (-1, 'ancx.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7','2014-01-01', '2050-01-01');
INSERT INTO CONNECTION_GROUP_STATE (ID, CONNECTION_ID, CONNECTION_GROUP_ID, VALID_FROM, VALID_UNTIL) VALUES (-2, 'qbcy.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7','2014-01-01', '2050-01-01');
INSERT INTO CONNECTION_GROUP_STATE (ID, CONNECTION_ID, CONNECTION_GROUP_ID, VALID_FROM, VALID_UNTIL) VALUES (-3, 'ancx.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e8','2014-01-01', '2050-01-01');
INSERT INTO CONNECTION_GROUP_STATE (ID, CONNECTION_ID, CONNECTION_GROUP_ID, VALID_FROM, VALID_UNTIL) VALUES (-4, 'qbcy.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e8','2014-01-01', '2050-01-01');

INSERT INTO AGGREGATOR_ON_CONNECTION_GROUP_STATE (ID, AGGREGATOR_DOMAIN, CONGESTION_POINT_CONNECTION_GROUP_ID, CONNECTION_COUNT, VALID_FROM, VALID_UNTIL) VALUES (-1,'agr1.usef-example.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7',1,'1970-01-01','2050-01-01');
INSERT INTO AGGREGATOR_ON_CONNECTION_GROUP_STATE (ID, AGGREGATOR_DOMAIN, CONGESTION_POINT_CONNECTION_GROUP_ID, CONNECTION_COUNT, VALID_FROM, VALID_UNTIL) VALUES (-2,'agr2.usef-example.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7',1,'1970-01-01','2020-01-01');
INSERT INTO AGGREGATOR_ON_CONNECTION_GROUP_STATE (ID, AGGREGATOR_DOMAIN, CONGESTION_POINT_CONNECTION_GROUP_ID, CONNECTION_COUNT, VALID_FROM, VALID_UNTIL) VALUES (-3,'agr3.usef-example.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7',1,'1970-01-01','1971-01-01');
INSERT INTO AGGREGATOR_ON_CONNECTION_GROUP_STATE (ID, AGGREGATOR_DOMAIN, CONGESTION_POINT_CONNECTION_GROUP_ID, CONNECTION_COUNT, VALID_FROM, VALID_UNTIL) VALUES (-4,'agr3.usef-example.com','ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7',1,'2020-01-01','2021-01-01');

INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID,CONNECTION_GROUP_ID) VALUES (6, 20141126110000127, 1,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO GRID_SAFETY_ANALYSIS (POWER, DISPOSITION, ID) VALUES (10, 'REQUESTED', 6);

INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID,CONNECTION_GROUP_ID) VALUES (7, 30141126110000235, 1,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO EXCHANGE (PARTICIPANT_DOMAIN,  ID) VALUES ('abc2.com', 7);
INSERT INTO PTU_PROGNOSIS (TYPE, POWER, ID) VALUES ('D_PROGNOSIS', 111, 7);

INSERT INTO GRID_SAFETY_ANALYSIS_TO_PROGNOSIS(GRID_SAFETY_ANALYSIS_ID, PROGNOSIS_ID) VALUES(6, 7);

INSERT INTO PROGNOSIS_UPDATE_DEVIATION(ID, PROGNOSIS_SEQUENCE, AGGREGATOR_DOMAIN, ORDERED_POWER, PREVIOUS_PROGNOSED_POWER, PROGNOSED_POWER) VALUES (-1, 20150116141712042, 'agr.usef-example.com', 1000,1500,750);

INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID,CONNECTION_GROUP_ID) VALUES (8, 20150122130501460, 4,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO EXCHANGE (PARTICIPANT_DOMAIN,  ID) VALUES ('agr.usef-example.com', 8);
INSERT INTO PTU_FLEXORDER (ID, FLEXOFFER_SEQUENCE, ACKNOWLEDGEMENT_STATUS) VALUES (8, 20150122120401460, 'ACCEPTED');

INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID,CONNECTION_GROUP_ID) VALUES (10, 20150124130501456, 4,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO PTU_GRID_MONITOR(ID, ACTUAL_POWER, LIMITED_POWER) VALUES (10, 1250, 1500)

INSERT INTO DOCUMENT (ID, SEQUENCE_NUMBER, PTU_CONTAINER_ID,CONNECTION_GROUP_ID) VALUES (11, 20150122130501460, 5,'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7');
INSERT INTO EXCHANGE (PARTICIPANT_DOMAIN,  ID) VALUES ('agr.usef-example.com', 11);
INSERT INTO PTU_FLEXORDER (ID, FLEXOFFER_SEQUENCE, ACKNOWLEDGEMENT_STATUS) VALUES (11, 20150122120401462, 'ACCEPTED');

INSERT INTO PLAN_BOARD_MESSAGE(ID, SEQUENCE_NUMBER, ORIGIN_SEQUENCE_NUMBER, PARTICIPANT_DOMAIN, DOCUMENT_STATUS, CONNECTION_GROUP_ID, DOCUMENT_TYPE, PTU_DATE) VALUES (1, 3333331, 2222221, 'usef-example1.com', 'ACCEPTED', 'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e7', 'FLEX_OFFER', '2014-11-20');
INSERT INTO PLAN_BOARD_MESSAGE(ID, SEQUENCE_NUMBER, ORIGIN_SEQUENCE_NUMBER, PARTICIPANT_DOMAIN, DOCUMENT_STATUS, CONNECTION_GROUP_ID, DOCUMENT_TYPE, PTU_DATE) VALUES (2, 3333332, 2222221, 'usef-example2.com', 'PROCESSED', 'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e8', 'FLEX_OFFER', '2014-11-20');
INSERT INTO PLAN_BOARD_MESSAGE(ID, SEQUENCE_NUMBER, ORIGIN_SEQUENCE_NUMBER, PARTICIPANT_DOMAIN, DOCUMENT_STATUS, CONNECTION_GROUP_ID, DOCUMENT_TYPE, PTU_DATE) VALUES (3, 20150122130501460, 2222221, 'usef-example2.com', 'ACCEPTED', 'ea1.1992-01.com.example:gridpoint.4f76ff19-a53b-49f5-84e8', 'FLEX_ORDER', '2014-10-19');
