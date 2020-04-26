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
-- SEQUENCES Tables
--
--

SELECT USER FROM DUAL;


CREATE OR REPLACE SYNONYM ${db.user}.FILE_REPOSITORY_SEQUENCE     FOR ${db.owner}.FILE_REPOSITORY_SEQUENCE  ;
CREATE OR REPLACE SYNONYM ${db.user}.role_seq    					FOR ${db.owner}.role_seq;
CREATE OR REPLACE SYNONYM ${db.user}.J0TCONFIGURATION_ID_seq    	FOR ${db.owner}.J0TCONFIGURATION_ID_seq;
CREATE OR REPLACE SYNONYM ${db.user}.J0TCOUPLING_ID_seq           FOR ${db.owner}.J0TCOUPLING_ID_seq        ;
CREATE OR REPLACE SYNONYM ${db.user}.J0TGROU_EVID_ID_seq      	FOR ${db.owner}.J0TGROU_EVID_ID_seq   ;
CREATE OR REPLACE SYNONYM ${db.user}.J0TXEVEN_ID_seq   			FOR ${db.owner}.J0TXEVEN_ID_seq ;
CREATE OR REPLACE SYNONYM ${db.user}.J1TUSER_AUDIT_ID_seq         FOR ${db.owner}.J1TUSER_AUDIT_ID_seq      ;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTOPIC_ID_SEQ              FOR ${db.owner}.J0TTOPIC_ID_SEQ ;
CREATE OR REPLACE SYNONYM ${db.user}.J1ACCOUNTING_EVENT_seq       FOR ${db.owner}.J1ACCOUNTING_EVENT_seq;
CREATE OR REPLACE SYNONYM ${db.user}.J1ACCOUNTING_EXTRACTIONS_seq FOR ${db.owner}.J1ACCOUNTING_EXTRACTIONS_seq;
CREATE OR REPLACE SYNONYM ${db.user}.J0TFORCE_BULK_ID_SEQ 		FOR ${db.owner}.J0TFORCE_BULK_ID_SEQ;
CREATE OR REPLACE SYNONYM ${db.user}.J0TTEMPLATE_ID_SEQ	 		FOR ${db.owner}.J0TTEMPLATE_ID_SEQ;
CREATE OR REPLACE SYNONYM ${db.user}.J0TRESOURCES_ZIP_ID_seq		FOR ${db.owner}.J0TRESOURCES_ZIP_ID_seq;
CREATE OR REPLACE SYNONYM ${db.user}.J0TPARTICIPANT_NEW_ID_SEQ	FOR ${db.owner}.J0TPARTICIPANT_NEW_ID_SEQ;

CREATE OR REPLACE SYNONYM ${db.user}.BICDIR_ID_SEQ	 		    FOR ${db.owner}.BICDIR_ID_SEQ;
CREATE OR REPLACE SYNONYM ${db.user}.COUNTRY_ID	 		        FOR ${db.owner}.COUNTRY_ID;
CREATE OR REPLACE SYNONYM ${db.user}.CURRENCY_ID	 		        FOR ${db.owner}.CURRENCY_ID;
CREATE OR REPLACE SYNONYM ${db.user}.DUPLICATION_CHECK_ID_SEQ	    FOR ${db.owner}.DUPLICATION_CHECK_ID_SEQ;
CREATE OR REPLACE SYNONYM ${db.user}.FINSIMREG_DN_SEQ	            FOR ${db.owner}.FINSIMREG_DN_SEQ;
CREATE OR REPLACE SYNONYM ${db.user}.J0TWEB_REPORT_ID_seq	        FOR ${db.owner}.J0TWEB_REPORT_ID_seq;
-- RMA Sequences
CREATE OR REPLACE SYNONYM ${db.user}.AGREEMENT_ID 				FOR ${db.owner}.AGREEMENT_ID;
CREATE OR REPLACE SYNONYM ${db.user}.QUERY_ID						FOR ${db.owner}.QUERY_ID;
CREATE OR REPLACE SYNONYM ${db.user}.REFERENCE_ID					FOR ${db.owner}.REFERENCE_ID;
CREATE OR REPLACE SYNONYM ${db.user}.ACTION_ID                    FOR ${db.owner}.ACTION_ID;
CREATE OR REPLACE SYNONYM ${db.user}.PERMISSION_ID                FOR ${db.owner}.PERMISSION_ID;
CREATE OR REPLACE SYNONYM ${db.user}.QACTION_ID                   FOR ${db.owner}.QACTION_ID;
CREATE OR REPLACE SYNONYM ${db.user}.ASP_ID                       FOR ${db.owner}.ASP_ID;
CREATE OR REPLACE SYNONYM ${db.user}.CONF_ID                      FOR ${db.owner}.CONF_ID;
CREATE OR REPLACE SYNONYM ${db.user}.LOGMESSAGE_ID                FOR ${db.owner}.LOGMESSAGE_ID;