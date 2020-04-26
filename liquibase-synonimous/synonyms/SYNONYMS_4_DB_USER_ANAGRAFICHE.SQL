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
-- General Tables
--
--

SELECT USER FROM DUAL;

CREATE OR REPLACE SYNONYM ${db.user}.BIC_DIRECTORY FOR ${db.owner}.BIC_DIRECTORY;
CREATE OR REPLACE SYNONYM ${db.user}.COUNTRY FOR ${db.owner}.COUNTRY;
CREATE OR REPLACE SYNONYM ${db.user}.CURRENCY FOR ${db.owner}.CURRENCY;

