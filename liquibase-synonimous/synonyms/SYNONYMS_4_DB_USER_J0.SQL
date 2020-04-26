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
-- J0 Tables
--
--

SELECT USER FROM DUAL;

CREATE OR REPLACE SYNONYM ${db.user}.J0TBULKER              FOR ${db.owner}.J0TBULKER;
CREATE OR REPLACE SYNONYM ${db.user}.J0TFORCE_BULK          FOR ${db.owner}.J0TFORCE_BULK;
CREATE OR REPLACE SYNONYM ${db.user}.J0TCONFIGURATION       FOR ${db.owner}.J0TCONFIGURATION;
CREATE OR REPLACE SYNONYM ${db.user}.J0TCONF_HISTORY        FOR ${db.owner}.J0TCONF_HISTORY;
CREATE OR REPLACE SYNONYM ${db.user}.J0TCOUPLING            FOR ${db.owner}.J0TCOUPLING;
CREATE OR REPLACE SYNONYM ${db.user}.J0TGROU_EVID           FOR ${db.owner}.J0TGROU_EVID;
CREATE OR REPLACE SYNONYM ${db.user}.J0TGROU_EVID_REL       FOR ${db.owner}.J0TGROU_EVID_REL;
CREATE OR REPLACE SYNONYM ${db.user}.J0TMQDUMPER            FOR ${db.owner}.J0TMQDUMPER;
CREATE OR REPLACE SYNONYM ${db.user}.J0TORGANIZATION        FOR ${db.owner}.J0TORGANIZATION;
CREATE OR REPLACE SYNONYM ${db.user}.J0TREPORT_TEMPLATE     FOR ${db.owner}.J0TREPORT_TEMPLATE;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTEMPLATE            FOR ${db.owner}.J0TTEMPLATE;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTOPIC               FOR ${db.owner}.J0TTOPIC;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTSINP               FOR ${db.owner}.J0TTSINP;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTSINS               FOR ${db.owner}.J0TTSINS;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTSISR               FOR ${db.owner}.J0TTSISR;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTSOUS               FOR ${db.owner}.J0TTSOUS;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTSOUT               FOR ${db.owner}.J0TTSOUT;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTSRTS               FOR ${db.owner}.J0TTSRTS;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTSSTA               FOR ${db.owner}.J0TTSSTA;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTTRSZ               FOR ${db.owner}.J0TTTRSZ;
CREATE OR REPLACE SYNONYM ${db.user}.J0TUSER_PREFS          FOR ${db.owner}.J0TUSER_PREFS;
CREATE OR REPLACE SYNONYM ${db.user}.J0TXEVEN               FOR ${db.owner}.J0TXEVEN;
CREATE OR REPLACE SYNONYM ${db.user}.J0TXINFO               FOR ${db.owner}.J0TXINFO;
CREATE OR REPLACE SYNONYM ${db.user}.J0TREQUEST_TYPE        FOR ${db.owner}.J0TREQUEST_TYPE;
CREATE OR REPLACE SYNONYM ${db.user}.J0TCURRENT_REVISION    FOR ${db.owner}.J0TCURRENT_REVISION;
CREATE OR REPLACE SYNONYM ${db.user}.J0TDOMAIN              FOR ${db.owner}.J0TDOMAIN;
CREATE OR REPLACE SYNONYM ${db.user}.J0TRESOURCES_ZIP       FOR ${db.owner}.J0TRESOURCES_ZIP;
CREATE OR REPLACE SYNONYM ${db.user}.J0TPARTICIPANT_NEW     FOR ${db.owner}.J0TPARTICIPANT_NEW;
CREATE OR REPLACE SYNONYM ${db.user}.J0TWEB_REPORT          FOR ${db.owner}.J0TWEB_REPORT;
