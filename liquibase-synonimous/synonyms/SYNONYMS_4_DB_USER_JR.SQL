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
-- JR Tables
--
--

SELECT USER FROM DUAL;

-- FIN
CREATE OR REPLACE SYNONYM ${db.user}.JRTCIT_CHEQUE 	   FOR ${db.owner}.JRTCIT_CHEQUE;
CREATE OR REPLACE SYNONYM ${db.user}.JRTCIT_CHEQUE_EVENT FOR ${db.owner}.JRTCIT_CHEQUE_EVENT;
CREATE OR REPLACE SYNONYM ${db.user}.JRTCIT_CHEQUE_IMAGE FOR ${db.owner}.JRTCIT_CHEQUE_IMAGE;
CREATE OR REPLACE SYNONYM ${db.user}.JRTCIT_SPORTCED	   FOR ${db.owner}.JRTCIT_SPORTCED;
CREATE OR REPLACE SYNONYM ${db.user}.JRTCIT_CIT000	   FOR ${db.owner}.JRTCIT_CIT000;

-- RNI
CREATE OR REPLACE SYNONYM ${db.user}.JRTRNI_BCIPHER_KEYS FOR ${db.owner}.JRTRNI_BCIPHER_KEYS;
CREATE OR REPLACE SYNONYM ${db.user}.JRTRNI_CRYPTO_KEYS  FOR ${db.owner}.JRTRNI_CRYPTO_KEYS ;
CREATE OR REPLACE SYNONYM ${db.user}.JRTRNI_MASTER_KEYS  FOR ${db.owner}.JRTRNI_MASTER_KEYS ;

