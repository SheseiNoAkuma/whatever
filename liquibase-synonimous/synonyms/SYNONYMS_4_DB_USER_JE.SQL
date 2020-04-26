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
-- JE Tables
--
--

SELECT USER FROM DUAL;

-- driver common
CREATE OR REPLACE SYNONYM ${db.user}.JETSTARTUP               FOR ${db.owner}.JETSTARTUP;
CREATE OR REPLACE SYNONYM ${db.user}.JETNETWORK_MESSAGE_SUSP  FOR ${db.owner}.JETNETWORK_MESSAGE_SUSP;

-- sag driver
CREATE OR REPLACE SYNONYM ${db.user}.JETSAG_PRIMITIVE_MSG     FOR ${db.owner}.JETSAG_PRIMITIVE_MSG;
CREATE OR REPLACE SYNONYM ${db.user}.JETSAG_SESSION           FOR ${db.owner}.JETSAG_SESSION;

-- saa internal simulator
CREATE OR REPLACE SYNONYM ${db.user}.FINSIM_REGISTRY          FOR ${db.owner}.FINSIM_REGISTRY;

