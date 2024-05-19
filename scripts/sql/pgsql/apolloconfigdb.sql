-- apolloconfigdb.accesskey definition

-- Drop table

-- DROP TABLE apolloconfigdb.accesskey;

CREATE TABLE apolloconfigdb.accesskey (
	id bigserial NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	secret varchar(128) DEFAULT ''::character varying NOT NULL,
	isenabled bool NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24590_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24590_datachange_lasttime ON apolloconfigdb.accesskey USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_24590_uk_appid_secret_deletedat ON apolloconfigdb.accesskey USING btree (appid, secret, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.accesskey for each row execute function on_update_current_timestamp_accesskey();


-- apolloconfigdb.app definition

-- Drop table

-- DROP TABLE apolloconfigdb.app;

CREATE TABLE apolloconfigdb.app (
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
	CONSTRAINT idx_24601_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24601_datachange_lasttime ON apolloconfigdb.app USING btree (datachange_lasttime);
CREATE INDEX idx_24601_ix_name ON apolloconfigdb.app USING btree (name);
CREATE UNIQUE INDEX idx_24601_uk_appid_deletedat ON apolloconfigdb.app USING btree (appid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.app for each row execute function on_update_current_timestamp_app();


-- apolloconfigdb.appnamespace definition

-- Drop table

-- DROP TABLE apolloconfigdb.appnamespace;

CREATE TABLE apolloconfigdb.appnamespace (
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
	CONSTRAINT idx_24618_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24618_datachange_lasttime ON apolloconfigdb.appnamespace USING btree (datachange_lasttime);
CREATE INDEX idx_24618_name_appid ON apolloconfigdb.appnamespace USING btree (name, appid);
CREATE UNIQUE INDEX idx_24618_uk_appid_name_deletedat ON apolloconfigdb.appnamespace USING btree (appid, name, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.appnamespace for each row execute function on_update_current_timestamp_appnamespace();


-- apolloconfigdb.audit definition

-- Drop table

-- DROP TABLE apolloconfigdb.audit;

CREATE TABLE apolloconfigdb.audit (
	id bigserial NOT NULL,
	entityname varchar(50) DEFAULT 'default'::character varying NOT NULL,
	entityid int8 NULL,
	opname varchar(50) DEFAULT 'default'::character varying NOT NULL,
	"comment" varchar(500) NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24631_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24631_datachange_lasttime ON apolloconfigdb.audit USING btree (datachange_lasttime);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.audit for each row execute function on_update_current_timestamp_audit();


-- apolloconfigdb.auditlog definition

-- Drop table

-- DROP TABLE apolloconfigdb.auditlog;

CREATE TABLE apolloconfigdb.auditlog (
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
	CONSTRAINT idx_24644_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24644_ix_datachange_createdtime ON apolloconfigdb.auditlog USING btree (datachange_createdtime);
CREATE INDEX idx_24644_ix_operator ON apolloconfigdb.auditlog USING btree (operator);
CREATE INDEX idx_24644_ix_opname ON apolloconfigdb.auditlog USING btree (opname);
CREATE INDEX idx_24644_ix_traceid ON apolloconfigdb.auditlog USING btree (traceid);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.auditlog for each row execute function on_update_current_timestamp_auditlog();


-- apolloconfigdb.auditlogdatainfluence definition

-- Drop table

-- DROP TABLE apolloconfigdb.auditlogdatainfluence;

CREATE TABLE apolloconfigdb.auditlogdatainfluence (
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
	CONSTRAINT idx_24659_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24659_ix_datachange_createdtime ON apolloconfigdb.auditlogdatainfluence USING btree (datachange_createdtime);
CREATE INDEX idx_24659_ix_entityid ON apolloconfigdb.auditlogdatainfluence USING btree (influenceentityid);
CREATE INDEX idx_24659_ix_spanid ON apolloconfigdb.auditlogdatainfluence USING btree (spanid);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.auditlogdatainfluence for each row execute function on_update_current_timestamp_auditlogdatainfluence();


-- apolloconfigdb."cluster" definition

-- Drop table

-- DROP TABLE apolloconfigdb."cluster";

CREATE TABLE apolloconfigdb."cluster" (
	id bigserial NOT NULL,
	"name" varchar(32) DEFAULT ''::character varying NOT NULL,
	appid varchar(64) DEFAULT ''::character varying NOT NULL,
	parentclusterid int8 DEFAULT '0'::bigint NOT NULL,
	"comment" varchar(64) NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24672_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24672_datachange_lasttime ON apolloconfigdb.cluster USING btree (datachange_lasttime);
CREATE INDEX idx_24672_ix_parentclusterid ON apolloconfigdb.cluster USING btree (parentclusterid);
CREATE UNIQUE INDEX idx_24672_uk_appid_name_deletedat ON apolloconfigdb.cluster USING btree (appid, name, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.cluster for each row execute function on_update_current_timestamp_cluster();


-- apolloconfigdb."commit" definition

-- Drop table

-- DROP TABLE apolloconfigdb."commit";

CREATE TABLE apolloconfigdb."commit" (
	id bigserial NOT NULL,
	changesets text NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	clustername varchar(500) DEFAULT 'default'::character varying NOT NULL,
	namespacename varchar(500) DEFAULT 'default'::character varying NOT NULL,
	"comment" varchar(500) NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24684_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24684_appid ON apolloconfigdb.commit USING btree (appid);
CREATE INDEX idx_24684_clustername ON apolloconfigdb.commit USING btree (clustername);
CREATE INDEX idx_24684_datachange_lasttime ON apolloconfigdb.commit USING btree (datachange_lasttime);
CREATE INDEX idx_24684_namespacename ON apolloconfigdb.commit USING btree (namespacename);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.commit for each row execute function on_update_current_timestamp_commit();


-- apolloconfigdb.grayreleaserule definition

-- Drop table

-- DROP TABLE apolloconfigdb.grayreleaserule;

CREATE TABLE apolloconfigdb.grayreleaserule (
	id bigserial NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	clustername varchar(32) DEFAULT 'default'::character varying NOT NULL,
	namespacename varchar(32) DEFAULT 'default'::character varying NOT NULL,
	branchname varchar(32) DEFAULT 'default'::character varying NOT NULL,
	rules varchar(16000) DEFAULT '[]'::character varying NULL,
	releaseid int8 DEFAULT '0'::bigint NOT NULL,
	branchstatus int2 DEFAULT '1'::smallint NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24698_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24698_datachange_lasttime ON apolloconfigdb.grayreleaserule USING btree (datachange_lasttime);
CREATE INDEX idx_24698_ix_namespace ON apolloconfigdb.grayreleaserule USING btree (appid, clustername, namespacename);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.grayreleaserule for each row execute function on_update_current_timestamp_grayreleaserule();


-- apolloconfigdb."instance" definition

-- Drop table

-- DROP TABLE apolloconfigdb."instance";

CREATE TABLE apolloconfigdb."instance" (
	id bigserial NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	clustername varchar(32) DEFAULT 'default'::character varying NOT NULL,
	datacenter varchar(64) DEFAULT 'default'::character varying NOT NULL,
	ip varchar(32) DEFAULT ''::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24716_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24716_ix_datachange_lasttime ON apolloconfigdb.instance USING btree (datachange_lasttime);
CREATE INDEX idx_24716_ix_ip ON apolloconfigdb.instance USING btree (ip);
CREATE UNIQUE INDEX idx_24716_ix_unique_key ON apolloconfigdb.instance USING btree (appid, clustername, ip, datacenter);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.instance for each row execute function on_update_current_timestamp_instance();


-- apolloconfigdb.instanceconfig definition

-- Drop table

-- DROP TABLE apolloconfigdb.instanceconfig;

CREATE TABLE apolloconfigdb.instanceconfig (
	id bigserial NOT NULL,
	instanceid int8 NULL,
	configappid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	configclustername varchar(32) DEFAULT 'default'::character varying NOT NULL,
	confignamespacename varchar(32) DEFAULT 'default'::character varying NOT NULL,
	releasekey varchar(64) DEFAULT ''::character varying NOT NULL,
	releasedeliverytime timestamptz NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24726_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24726_ix_datachange_lasttime ON apolloconfigdb.instanceconfig USING btree (datachange_lasttime);
CREATE INDEX idx_24726_ix_releasekey ON apolloconfigdb.instanceconfig USING btree (releasekey);
CREATE UNIQUE INDEX idx_24726_ix_unique_key ON apolloconfigdb.instanceconfig USING btree (instanceid, configappid, confignamespacename);
CREATE INDEX idx_24726_ix_valid_namespace ON apolloconfigdb.instanceconfig USING btree (configappid, configclustername, confignamespacename, datachange_lasttime);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.instanceconfig for each row execute function on_update_current_timestamp_instanceconfig();


-- apolloconfigdb.item definition

-- Drop table

-- DROP TABLE apolloconfigdb.item;

CREATE TABLE apolloconfigdb.item (
	id bigserial NOT NULL,
	namespaceid int8 DEFAULT '0'::bigint NOT NULL,
	"key" varchar(128) DEFAULT 'default'::character varying NOT NULL,
	"type" int2 DEFAULT '0'::smallint NOT NULL,
	value text NOT NULL,
	"comment" varchar(1024) DEFAULT ''::character varying NULL,
	linenum int8 DEFAULT '0'::bigint NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24736_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24736_datachange_lasttime ON apolloconfigdb.item USING btree (datachange_lasttime);
CREATE INDEX idx_24736_ix_groupid ON apolloconfigdb.item USING btree (namespaceid);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.item for each row execute function on_update_current_timestamp_item();


-- apolloconfigdb."namespace" definition

-- Drop table

-- DROP TABLE apolloconfigdb."namespace";

CREATE TABLE apolloconfigdb."namespace" (
	id bigserial NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	clustername varchar(500) DEFAULT 'default'::character varying NOT NULL,
	namespacename varchar(500) DEFAULT 'default'::character varying NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24752_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24752_datachange_lasttime ON apolloconfigdb.namespace USING btree (datachange_lasttime);
CREATE INDEX idx_24752_ix_namespacename ON apolloconfigdb.namespace USING btree (namespacename);
CREATE UNIQUE INDEX idx_24752_uk_appid_clustername_namespacename_deletedat ON apolloconfigdb.namespace USING btree (appid, clustername, namespacename, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.namespace for each row execute function on_update_current_timestamp_namespace();


-- apolloconfigdb.namespacelock definition

-- Drop table

-- DROP TABLE apolloconfigdb.namespacelock;

CREATE TABLE apolloconfigdb.namespacelock (
	id bigserial NOT NULL,
	namespaceid int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	isdeleted bool NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	CONSTRAINT idx_24766_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24766_datachange_lasttime ON apolloconfigdb.namespacelock USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_24766_uk_namespaceid_deletedat ON apolloconfigdb.namespacelock USING btree (namespaceid, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.namespacelock for each row execute function on_update_current_timestamp_namespacelock();


-- apolloconfigdb."release" definition

-- Drop table

-- DROP TABLE apolloconfigdb."release";

CREATE TABLE apolloconfigdb."release" (
	id bigserial NOT NULL,
	releasekey varchar(64) DEFAULT ''::character varying NOT NULL,
	"name" varchar(64) DEFAULT 'default'::character varying NOT NULL,
	"comment" varchar(256) NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	clustername varchar(500) DEFAULT 'default'::character varying NOT NULL,
	namespacename varchar(500) DEFAULT 'default'::character varying NOT NULL,
	configurations text NOT NULL,
	isabandoned bool NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24776_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24776_appid_clustername_groupname ON apolloconfigdb.release USING btree (appid, clustername, namespacename);
CREATE INDEX idx_24776_datachange_lasttime ON apolloconfigdb.release USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_24776_uk_releasekey_deletedat ON apolloconfigdb.release USING btree (releasekey, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.release for each row execute function on_update_current_timestamp_release();


-- apolloconfigdb.releasehistory definition

-- Drop table

-- DROP TABLE apolloconfigdb.releasehistory;

CREATE TABLE apolloconfigdb.releasehistory (
	id bigserial NOT NULL,
	appid varchar(64) DEFAULT 'default'::character varying NOT NULL,
	clustername varchar(32) DEFAULT 'default'::character varying NOT NULL,
	namespacename varchar(32) DEFAULT 'default'::character varying NOT NULL,
	branchname varchar(32) DEFAULT 'default'::character varying NOT NULL,
	releaseid int8 DEFAULT '0'::bigint NOT NULL,
	previousreleaseid int8 DEFAULT '0'::bigint NOT NULL,
	operation int2 DEFAULT '0'::smallint NOT NULL,
	operationcontext text NOT NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24792_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24792_ix_datachange_lasttime ON apolloconfigdb.releasehistory USING btree (datachange_lasttime);
CREATE INDEX idx_24792_ix_namespace ON apolloconfigdb.releasehistory USING btree (appid, clustername, namespacename, branchname);
CREATE INDEX idx_24792_ix_previousreleaseid ON apolloconfigdb.releasehistory USING btree (previousreleaseid);
CREATE INDEX idx_24792_ix_releaseid ON apolloconfigdb.releasehistory USING btree (releaseid);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.releasehistory for each row execute function on_update_current_timestamp_releasehistory();


-- apolloconfigdb.releasemessage definition

-- Drop table

-- DROP TABLE apolloconfigdb.releasemessage;

CREATE TABLE apolloconfigdb.releasemessage (
	id bigserial NOT NULL,
	message varchar(1024) DEFAULT ''::character varying NOT NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24810_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24810_datachange_lasttime ON apolloconfigdb.releasemessage USING btree (datachange_lasttime);
CREATE INDEX idx_24810_ix_message ON apolloconfigdb.releasemessage USING btree (message);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.releasemessage for each row execute function on_update_current_timestamp_releasemessage();


-- apolloconfigdb.serverconfig definition

-- Drop table

-- DROP TABLE apolloconfigdb.serverconfig;

CREATE TABLE apolloconfigdb.serverconfig (
	id bigserial NOT NULL,
	"key" varchar(64) DEFAULT 'default'::character varying NOT NULL,
	"cluster" varchar(32) DEFAULT 'default'::character varying NOT NULL,
	value varchar(2048) DEFAULT 'default'::character varying NOT NULL,
	"comment" varchar(1024) DEFAULT ''::character varying NULL,
	isdeleted bool NOT NULL,
	deletedat int8 DEFAULT '0'::bigint NOT NULL,
	datachange_createdby varchar(64) DEFAULT 'default'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lastmodifiedby varchar(64) DEFAULT ''::character varying NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24818_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24818_datachange_lasttime ON apolloconfigdb.serverconfig USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_24818_uk_key_cluster_deletedat ON apolloconfigdb.serverconfig USING btree (key, cluster, deletedat);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.serverconfig for each row execute function on_update_current_timestamp_serverconfig();


-- apolloconfigdb.serviceregistry definition

-- Drop table

-- DROP TABLE apolloconfigdb.serviceregistry;

CREATE TABLE apolloconfigdb.serviceregistry (
	id bigserial NOT NULL,
	servicename varchar(64) NOT NULL,
	uri varchar(64) NOT NULL,
	"cluster" varchar(64) NOT NULL,
	metadata varchar(1024) DEFAULT '{}'::character varying NOT NULL,
	datachange_createdtime timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	datachange_lasttime timestamptz NULL,
	CONSTRAINT idx_24833_primary PRIMARY KEY (id)
);
CREATE INDEX idx_24833_ix_datachange_lasttime ON apolloconfigdb.serviceregistry USING btree (datachange_lasttime);
CREATE UNIQUE INDEX idx_24833_ix_unique_key ON apolloconfigdb.serviceregistry USING btree (servicename, uri);

-- Table Triggers

create trigger on_update_current_timestamp before
update
    on
    apolloconfigdb.serviceregistry for each row execute function on_update_current_timestamp_serviceregistry();