INSERT INTO apolloconfigdb.accesskey
(id, appid, secret, isenabled, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('accesskey_id_seq'::regclass), 'default'::character varying, ''::character varying, false, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.app
(id, appid, "name", orgid, orgname, ownername, owneremail, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('app_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.appnamespace
(id, "name", appid, "format", ispublic, "comment", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('appnamespace_id_seq'::regclass), ''::character varying, ''::character varying, 'properties'::character varying, false, ''::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.audit
(id, entityname, entityid, opname, "comment", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('audit_id_seq'::regclass), 'default'::character varying, 0, 'default'::character varying, '', false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.auditlog
(id, traceid, spanid, parentspanid, followsfromspanid, "operator", optype, opname, description, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('auditlog_id_seq'::regclass), ''::character varying, ''::character varying, '', '', 'anonymous'::character varying, 'default'::character varying, 'default'::character varying, '', false, '0'::bigint, '', CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.auditlogdatainfluence
(id, spanid, influenceentityid, influenceentityname, fieldname, fieldoldvalue, fieldnewvalue, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('auditlogdatainfluence_id_seq'::regclass), ''::bpchar, '0'::character varying, 'default'::character varying, '', '', '', false, '0'::bigint, '', CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb."cluster"
(id, "name", appid, parentclusterid, "comment", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('cluster_id_seq'::regclass), ''::character varying, ''::character varying, '0'::bigint, '', false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb."commit"
(id, changesets, appid, clustername, namespacename, "comment", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('commit_id_seq'::regclass), '', 'default'::character varying, 'default'::character varying, 'default'::character varying, '', false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.grayreleaserule
(id, appid, clustername, namespacename, branchname, rules, releaseid, branchstatus, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('grayreleaserule_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, '[]'::character varying, '0'::bigint, '1'::smallint, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb."instance"
(id, appid, clustername, datacenter, ip, datachange_createdtime, datachange_lasttime)
VALUES(nextval('instance_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, ''::character varying, CURRENT_TIMESTAMP, '');
INSERT INTO apolloconfigdb.instanceconfig
(id, instanceid, configappid, configclustername, confignamespacename, releasekey, releasedeliverytime, datachange_createdtime, datachange_lasttime)
VALUES(nextval('instanceconfig_id_seq'::regclass), 0, 'default'::character varying, 'default'::character varying, 'default'::character varying, ''::character varying, '', CURRENT_TIMESTAMP, '');
INSERT INTO apolloconfigdb.item
(id, namespaceid, "key", "type", value, "comment", linenum, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('item_id_seq'::regclass), '0'::bigint, 'default'::character varying, '0'::smallint, '', ''::character varying, '0'::bigint, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb."namespace"
(id, appid, clustername, namespacename, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('namespace_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.namespacelock
(id, namespaceid, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime, isdeleted, deletedat)
VALUES(nextval('namespacelock_id_seq'::regclass), '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '', false, '0'::bigint);
INSERT INTO apolloconfigdb."release"
(id, releasekey, "name", "comment", appid, clustername, namespacename, configurations, isabandoned, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('release_id_seq'::regclass), ''::character varying, 'default'::character varying, '', 'default'::character varying, 'default'::character varying, 'default'::character varying, '', false, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.releasehistory
(id, appid, clustername, namespacename, branchname, releaseid, previousreleaseid, operation, operationcontext, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('releasehistory_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, '0'::bigint, '0'::bigint, '0'::smallint, '', false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.releasemessage
(id, message, datachange_lasttime)
VALUES(nextval('releasemessage_id_seq'::regclass), ''::character varying, '');
INSERT INTO apolloconfigdb.serverconfig
(id, "key", "cluster", value, "comment", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('serverconfig_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, ''::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloconfigdb.serviceregistry
(id, servicename, uri, "cluster", metadata, datachange_createdtime, datachange_lasttime)
VALUES(nextval('serviceregistry_id_seq'::regclass), '', '', '', '{}'::character varying, CURRENT_TIMESTAMP, '');