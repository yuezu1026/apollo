-- apolloportaldb.app definition

-- Drop table

-- DROP TABLE apolloportaldb.app;

CREATE TABLE apolloportaldb.app (
	id bigserial NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	"name" varchar(500) DEFAULT 'default'::character varying NOT NULL,
	orgid varchar(32) DEFAULT 'default'::character varying NOT NULL,
	orgname varchar(64) DEFAULT 'default'::character varying NOT NULL,
	ownername varchar(500) DEFAULT 'default'::character varying NOT NULL,
	owneremail varchar(500) DEFAULT 'default'::character varying NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25290_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25290_datachange_lasttime ON apolloportaldb.app USING btree (datachange_lasttime);
CREATE INDEX idx_25290_ix_name ON apolloportaldb.app USING btree (name);
CREATE UNIQUE INDEX idx_25290_uk_appid_deletedat ON apolloportaldb.app USING btree (appid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.app for each row execute function on_update_current_timestamp_app();


-- apolloportaldb.appnamespace definition

-- Drop table

-- DROP TABLE apolloportaldb.appnamespace;

CREATE TABLE apolloportaldb.appnamespace (
	id bigserial NOT NULL,
	"name" varchar(32) DEFAULT ''::character varying NOT NULL,
	appid varchar(64) DEFAULT ''::character varying NOT NULL,
	"format" varchar(32) DEFAULT 'properties'::character varying NOT NULL,
	ispublic bool NOT NULL,
	"comment" varchar(64) DEFAULT ''::character varying NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25307_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25307_datachange_lasttime ON apolloportaldb.appnamespace USING btree (datachange_lasttime);
CREATE INDEX idx_25307_name_appid ON apolloportaldb.appnamespace USING btree (name, appid);
CREATE UNIQUE INDEX idx_25307_uk_appid_name_deletedat ON apolloportaldb.appnamespace USING btree (appid, name, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.appnamespace for each row execute function on_update_current_timestamp_appnamespace();


-- apolloportaldb.auditlog definition

-- Drop table

-- DROP TABLE apolloportaldb.auditlog;

CREATE TABLE apolloportaldb.auditlog (
	id bigserial NOT NULL,
	traceid varchar(32) DEFAULT ''::character varying NOT NULL,
	spanid varchar(32) DEFAULT ''::character varying NOT NULL,
	parentspanid varchar(32) NULL,
	followsfromspanid varchar(32) NULL,
	"operator" varchar(64) DEFAULT 'anonymous'::character varying NOT NULL,
	optype varchar(50) DEFAULT 'default'::character varying NOT NULL,
	opname varchar(150) DEFAULT 'default'::character varying NOT NULL,
	description varchar(200) NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25320_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25320_ix_datachange_createdtime ON apolloportaldb.auditlog USING btree (datachange_createdtime);
CREATE INDEX idx_25320_ix_operator ON apolloportaldb.auditlog USING btree (operator);
CREATE INDEX idx_25320_ix_opname ON apolloportaldb.auditlog USING btree (opname);
CREATE INDEX idx_25320_ix_traceid ON apolloportaldb.auditlog USING btree (traceid);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.auditlog for each row execute function on_update_current_timestamp_auditlog();


-- apolloportaldb.auditlogdatainfluence definition

-- Drop table

-- DROP TABLE apolloportaldb.auditlogdatainfluence;

CREATE TABLE apolloportaldb.auditlogdatainfluence (
	id bigserial NOT NULL,
	spanid bpchar(32) DEFAULT ''::bpchar NOT NULL,
	influenceentityid varchar(50) DEFAULT '0'::character varying NOT NULL,
	influenceentityname varchar(50) DEFAULT 'default'::character varying NOT NULL,
	fieldname varchar(50) NULL,
	fieldoldvalue varchar(500) NULL,
	fieldnewvalue varchar(500) NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25335_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25335_ix_datachange_createdtime ON apolloportaldb.auditlogdatainfluence USING btree (datachange_createdtime);
CREATE INDEX idx_25335_ix_entityid ON apolloportaldb.auditlogdatainfluence USING btree (influenceentityid);
CREATE INDEX idx_25335_ix_spanid ON apolloportaldb.auditlogdatainfluence USING btree (spanid);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.auditlogdatainfluence for each row execute function on_update_current_timestamp_auditlogdatainfluence();


-- apolloportaldb.authorities definition

-- Drop table

-- DROP TABLE apolloportaldb.authorities;

CREATE TABLE apolloportaldb.authorities (
	id bigserial NOT NULL,
	username varchar(64) NOT NULL,
	authority varchar(50) NOT NULL,
	CONSTRAINT idx_25348_primary PRIMARY KEY (id)
);


-- apolloportaldb.consumer definition

-- Drop table

-- DROP TABLE apolloportaldb.consumer;

CREATE TABLE apolloportaldb.consumer (
	id bigserial NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	"name" varchar(500) DEFAULT 'default'::character varying NOT NULL,
	orgid varchar(32) DEFAULT 'default'::character varying NOT NULL,
	orgname varchar(64) DEFAULT 'default'::character varying NOT NULL,
	ownername varchar(500) DEFAULT 'default'::character varying NOT NULL,
	owneremail varchar(500) DEFAULT 'default'::character varying NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25353_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25353_datachange_lasttime ON apolloportaldb.consumer USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_25353_uk_appid_deletedat ON apolloportaldb.consumer USING btree (appid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.consumer for each row execute function on_update_current_timestamp_consumer();


-- apolloportaldb.consumeraudit definition

-- Drop table

-- DROP TABLE apolloportaldb.consumeraudit;

CREATE TABLE apolloportaldb.consumeraudit (
	id bigserial NOT NULL,
	consumerid int8 NULL,
	uri varchar(1024) DEFAULT ''::character varying NOT NULL,
	"method" varchar(16) DEFAULT ''::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25370_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25370_ix_consumerid ON apolloportaldb.consumeraudit USING btree (consumerid);
CREATE INDEX idx_25370_ix_datachange_lasttime ON apolloportaldb.consumeraudit USING btree (datachange_lasttime);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.consumeraudit for each row execute function on_update_current_timestamp_consumeraudit();


-- apolloportaldb.consumerrole definition

-- Drop table

-- DROP TABLE apolloportaldb.consumerrole;

CREATE TABLE apolloportaldb.consumerrole (
	id bigserial NOT NULL,
	consumerid int8 NULL,
	roleid int8 NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25380_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25380_ix_datachange_lasttime ON apolloportaldb.consumerrole USING btree (datachange_lasttime);
CREATE INDEX idx_25380_ix_roleid ON apolloportaldb.consumerrole USING btree (roleid);
CREATE UNIQUE INDEX idx_25380_uk_consumerid_roleid_deletedat ON apolloportaldb.consumerrole USING btree (consumerid, roleid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.consumerrole for each row execute function on_update_current_timestamp_consumerrole();


-- apolloportaldb.consumertoken definition

-- Drop table

-- DROP TABLE apolloportaldb.consumertoken;

CREATE TABLE apolloportaldb.consumertoken (
	id bigserial NOT NULL,
	consumerid int8 NULL,
	"token" varchar(128) DEFAULT ''::character varying NOT NULL,
	expires timestamptz DEFAULT '2099-01-01 08:00:00+08'::timestamp with time zone NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25389_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25389_datachange_lasttime ON apolloportaldb.consumertoken USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_25389_uk_token_deletedat ON apolloportaldb.consumertoken USING btree (token, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.consumertoken for each row execute function on_update_current_timestamp_consumertoken();


-- apolloportaldb.favorite definition

-- Drop table

-- DROP TABLE apolloportaldb.favorite;

CREATE TABLE apolloportaldb.favorite (
	id bigserial NOT NULL,
	userid varchar(32) DEFAULT 'default'::character varying NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	"position" int8 DEFAULT '10000'::bigint NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25400_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25400_appid ON apolloportaldb.favorite USING btree (appid);
CREATE INDEX idx_25400_datachange_lasttime ON apolloportaldb.favorite USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_25400_uk_userid_appid_deletedat ON apolloportaldb.favorite USING btree (userid, appid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.favorite for each row execute function on_update_current_timestamp_favorite();


-- apolloportaldb."permission" definition

-- Drop table

-- DROP TABLE apolloportaldb."permission";

CREATE TABLE apolloportaldb."permission" (
	id bigserial NOT NULL,
	permissiontype varchar(32) DEFAULT ''::character varying NOT NULL,
	targetid varchar(256) DEFAULT ''::character varying NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25412_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25412_ix_datachange_lasttime ON apolloportaldb.permission USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_25412_uk_targetid_permissiontype_deletedat ON apolloportaldb.permission USING btree (targetid, permissiontype, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.permission for each row execute function on_update_current_timestamp_permission();


-- apolloportaldb."role" definition

-- Drop table

-- DROP TABLE apolloportaldb."role";

CREATE TABLE apolloportaldb."role" (
	id bigserial NOT NULL,
	rolename varchar(256) DEFAULT ''::character varying NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25423_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25423_ix_datachange_lasttime ON apolloportaldb.role USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_25423_uk_rolename_deletedat ON apolloportaldb.role USING btree (rolename, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.role for each row execute function on_update_current_timestamp_role();


-- apolloportaldb.rolepermission definition

-- Drop table

-- DROP TABLE apolloportaldb.rolepermission;

CREATE TABLE apolloportaldb.rolepermission (
	id bigserial NOT NULL,
	roleid int8 NULL,
	permissionid int8 NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25433_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25433_ix_datachange_lasttime ON apolloportaldb.rolepermission USING btree (datachange_lasttime);
CREATE INDEX idx_25433_ix_permissionid ON apolloportaldb.rolepermission USING btree (permissionid);
CREATE UNIQUE INDEX idx_25433_uk_roleid_permissionid_deletedat ON apolloportaldb.rolepermission USING btree (roleid, permissionid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.rolepermission for each row execute function on_update_current_timestamp_rolepermission();


-- apolloportaldb.serverconfig definition

-- Drop table

-- DROP TABLE apolloportaldb.serverconfig;

CREATE TABLE apolloportaldb.serverconfig (
	id bigserial NOT NULL,
	"key" varchar(64) DEFAULT 'default'::character varying NOT NULL,
	value varchar(2048) DEFAULT 'default'::character varying NOT NULL,
	"comment" varchar(1024) DEFAULT ''::character varying NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25442_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25442_datachange_lasttime ON apolloportaldb.serverconfig USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_25442_uk_key_deletedat ON apolloportaldb.serverconfig USING btree (key, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.serverconfig for each row execute function on_update_current_timestamp_serverconfig();


-- apolloportaldb.spring_session definition

-- Drop table

-- DROP TABLE apolloportaldb.spring_session;

CREATE TABLE apolloportaldb.spring_session (
	primary_id bpchar(36) NOT NULL,
	session_id bpchar(36) NOT NULL,
	creation_time int8 NOT NULL,
	last_access_time int8 NOT NULL,
	max_inactive_interval int8 NOT NULL,
	expiry_time int8 NOT NULL,
	principal_name varchar(100) NULL,
	CONSTRAINT idx_25455_primary PRIMARY KEY (primary_id)
);
CREATE UNIQUE INDEX idx_25455_spring_session_ix1 ON apolloportaldb.spring_session USING btree (session_id);
CREATE INDEX idx_25455_spring_session_ix2 ON apolloportaldb.spring_session USING btree (expiry_time);
CREATE INDEX idx_25455_spring_session_ix3 ON apolloportaldb.spring_session USING btree (principal_name);


-- apolloportaldb.userrole definition

-- Drop table

-- DROP TABLE apolloportaldb.userrole;

CREATE TABLE apolloportaldb.userrole (
	id bigserial NOT NULL,
	userid varchar(128) DEFAULT ''::character varying NULL,
	roleid int8 NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_25464_primary PRIMARY KEY (id)
);
CREATE INDEX idx_25464_ix_datachange_lasttime ON apolloportaldb.userrole USING btree (datachange_lasttime);
CREATE INDEX idx_25464_ix_roleid ON apolloportaldb.userrole USING btree (roleid);
CREATE UNIQUE INDEX idx_25464_uk_userid_roleid_deletedat ON apolloportaldb.userrole USING btree (userid, roleid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloportaldb.userrole for each row execute function on_update_current_timestamp_userrole();


-- apolloportaldb.users definition

-- Drop table

-- DROP TABLE apolloportaldb.users;

CREATE TABLE apolloportaldb.users (
	id bigserial NOT NULL,
	username varchar(64) DEFAULT 'default'::character varying NOT NULL,
	"password" varchar(512) DEFAULT 'default'::character varying NOT NULL,
	userdisplayname varchar(512) DEFAULT 'default'::character varying NOT NULL,
	email varchar(64) DEFAULT 'default'::character varying NOT NULL,
	enabled int2 NULL,
	CONSTRAINT idx_25474_primary PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_25474_uk_username ON apolloportaldb.users USING btree (username);


-- apolloportaldb.spring_session_attributes definition

-- Drop table

-- DROP TABLE apolloportaldb.spring_session_attributes;

CREATE TABLE apolloportaldb.spring_session_attributes (
	session_primary_id bpchar(36) NOT NULL,
	attribute_name varchar(200) NOT NULL,
	attribute_bytes bytea NOT NULL,
	CONSTRAINT idx_25458_primary PRIMARY KEY (session_primary_id, attribute_name),
	CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES apolloportaldb.spring_session(primary_id) ON DELETE CASCADE ON UPDATE RESTRICT
);