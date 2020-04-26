-- Title: Project TAS NETWORK GATEWAY FIN
-- Copyright: Copyright (c) 2019
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

-- CREATE OR REPLACE Synonyms for Users 4 SSO Tables
CREATE OR REPLACE SYNONYM ${db.user}.USERS4SSO FOR ${db.owner}.USERS4SSO;

-- CREATE OR REPLACE Synonyms for Sequences
CREATE OR REPLACE SYNONYM ${db.user}.USERS4SSO_ID_SEQ FOR ${db.owner}.USERS4SSO_ID_SEQ;