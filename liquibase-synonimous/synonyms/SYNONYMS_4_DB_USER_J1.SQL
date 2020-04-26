-- Title: Project TAS NETWORK GATEWAY FIN
-- Copyright: Copyright (c) 2016
-- Company: TAS S.p.A.
-- Warning: This computer program and its source code is protected by
-- copyright law and international treaties. Unauthorized reproduction
-- or distribution of this code or any portion of it, may result in
-- severe civil and criminal penalties, and will be prosecuted to the
-- maximum extent possible under the law
--
-- DB Oracle Script file for TAS NETWORK GATEWAY - Delivery Package
-- To launch once connected as DB_USER


--
--
-- J1 Tables
--
--

SELECT USER FROM DUAL;

CREATE OR REPLACE SYNONYM ${db.user}.J1TSUSPENDED_MESSAGE FOR ${db.owner}.J1TSUSPENDED_MESSAGE;
CREATE OR REPLACE SYNONYM ${db.user}.J1TWORKING_PROCESS FOR ${db.owner}.J1TWORKING_PROCESS;
CREATE OR REPLACE SYNONYM ${db.user}.J1ACCOUNTING_EVENT FOR ${db.owner}.J1ACCOUNTING_EVENT;
CREATE OR REPLACE SYNONYM ${db.user}.J1ACCOUNTING_EXTRACTIONS FOR ${db.owner}.J1ACCOUNTING_EXTRACTIONS;
CREATE OR REPLACE SYNONYM ${db.user}.J1TUSER_AUDIT FOR ${db.owner}.J1TUSER_AUDIT;
