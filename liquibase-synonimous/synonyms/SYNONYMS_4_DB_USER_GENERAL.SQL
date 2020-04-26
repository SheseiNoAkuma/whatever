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

CREATE OR REPLACE SYNONYM ${db.user}.ROLE FOR ${db.owner}.ROLE;
CREATE OR REPLACE SYNONYM ${db.user}.FILE_REPOSITORY FOR ${db.owner}.FILE_REPOSITORY;
CREATE OR REPLACE SYNONYM ${db.user}.DUPLICATION_CHECK  FOR ${db.owner}.DUPLICATION_CHECK;

-- OSQuartz tables
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_calendars FOR ${db.owner}.qrtz_calendars;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_fired_triggers FOR ${db.owner}.qrtz_fired_triggers;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_blob_triggers FOR ${db.owner}.qrtz_blob_triggers;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_cron_triggers FOR ${db.owner}.qrtz_cron_triggers;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_simple_triggers FOR ${db.owner}.qrtz_simple_triggers;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_simprop_triggers FOR ${db.owner}.qrtz_simprop_triggers;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_triggers FOR ${db.owner}.qrtz_triggers;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_job_details FOR ${db.owner}.qrtz_job_details;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_paused_trigger_grps FOR ${db.owner}.qrtz_paused_trigger_grps;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_locks FOR ${db.owner}.qrtz_locks;
CREATE OR REPLACE SYNONYM ${db.user}.qrtz_scheduler_state FOR ${db.owner}.qrtz_scheduler_state;
