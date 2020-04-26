-- Title: Project TAS NETWORK GATEWAY FIN
-- Copyright: Copyright (c) 2016
-- Company: TAS S.p.A.
-- Warning: This computer program and its source code is protected by
-- copyright law and international treaties. Unauthorized reproduction
-- or distribution of this code or any portion of it, may result in
-- severe civil and criminal penalties, and will be prosecuted to the
-- maximum extent possible under the law
--
-- DB Oracle Script file for TAS NETWORK GATEWAY FIN - Delivery Package
-- To launch once connected as DB_USER


--
--
-- SYNONYMS FOR RMA Tables
--
--

SELECT USER FROM DUAL;

CREATE OR REPLACE SYNONYM ${db.user}.ACTIONS FOR ${db.owner}.ACTIONS;
CREATE OR REPLACE SYNONYM ${db.user}.AGREEMENT FOR ${db.owner}.AGREEMENT;
CREATE OR REPLACE SYNONYM ${db.user}.ASP FOR ${db.owner}.ASP;
CREATE OR REPLACE SYNONYM ${db.user}.CONF FOR ${db.owner}.CONF;
CREATE OR REPLACE SYNONYM ${db.user}.LOGMESSAGE FOR ${db.owner}.LOGMESSAGE;
CREATE OR REPLACE SYNONYM ${db.user}.PERMISSION FOR ${db.owner}.PERMISSION;
CREATE OR REPLACE SYNONYM ${db.user}.QACTION FOR ${db.owner}.QACTION;
CREATE OR REPLACE SYNONYM ${db.user}.QUERY FOR ${db.owner}.QUERY;
CREATE OR REPLACE SYNONYM ${db.user}.JMS_ERROR FOR ${db.owner}.JMS_ERROR;

CREATE OR REPLACE SYNONYM ${db.user}.AGREEMENT_PROGRESS FOR ${db.owner}.AGREEMENT_PROGRESS;
CREATE OR REPLACE SYNONYM ${db.user}.QUERY_PROGRESS FOR ${db.owner}.QUERY_PROGRESS;