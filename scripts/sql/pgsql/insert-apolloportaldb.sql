INSERT INTO apolloportaldb.app
(id, appid, "name", orgid, orgname, ownername, owneremail, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('app_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.appnamespace
(id, "name", appid, "format", ispublic, "comment", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('appnamespace_id_seq'::regclass), ''::character varying, ''::character varying, 'properties'::character varying, false, ''::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.auditlog
(id, traceid, spanid, parentspanid, followsfromspanid, "operator", optype, opname, description, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('auditlog_id_seq'::regclass), ''::character varying, ''::character varying, '', '', 'anonymous'::character varying, 'default'::character varying, 'default'::character varying, '', false, '0'::bigint, '', CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.auditlogdatainfluence
(id, spanid, influenceentityid, influenceentityname, fieldname, fieldoldvalue, fieldnewvalue, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('auditlogdatainfluence_id_seq'::regclass), ''::bpchar, '0'::character varying, 'default'::character varying, '', '', '', false, '0'::bigint, '', CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.authorities
(id, username, authority)
VALUES(nextval('authorities_id_seq'::regclass), '', '');
INSERT INTO apolloportaldb.consumer
(id, appid, "name", orgid, orgname, ownername, owneremail, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('consumer_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.consumeraudit
(id, consumerid, uri, "method", datachange_createdtime, datachange_lasttime)
VALUES(nextval('consumeraudit_id_seq'::regclass), 0, ''::character varying, ''::character varying, CURRENT_TIMESTAMP, '');
INSERT INTO apolloportaldb.consumerrole
(id, consumerid, roleid, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('consumerrole_id_seq'::regclass), 0, 0, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.consumertoken
(id, consumerid, "token", expires, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('consumertoken_id_seq'::regclass), 0, ''::character varying, '2099-01-01 08:00:00+08'::timestamp with time zone, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.favorite
(id, userid, appid, "position", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('favorite_id_seq'::regclass), 'default'::character varying, 'default'::character varying, '10000'::bigint, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb."permission"
(id, permissiontype, targetid, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('permission_id_seq'::regclass), ''::character varying, ''::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb."role"
(id, rolename, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('role_id_seq'::regclass), ''::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.rolepermission
(id, roleid, permissionid, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('rolepermission_id_seq'::regclass), 0, 0, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.serverconfig
(id, "key", value, "comment", isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('serverconfig_id_seq'::regclass), 'default'::character varying, 'default'::character varying, ''::character varying, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.spring_session
(primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name)
VALUES('', '', 0, 0, 0, 0, '');
INSERT INTO apolloportaldb.spring_session_attributes
(session_primary_id, attribute_name, attribute_bytes)
VALUES('', '', ?);
INSERT INTO apolloportaldb.userrole
(id, userid, roleid, isdeleted, deletedat, datachange_createdby, datachange_createdtime, datachange_lastmodifiedby, datachange_lasttime)
VALUES(nextval('userrole_id_seq'::regclass), ''::character varying, 0, false, '0'::bigint, 'default'::character varying, CURRENT_TIMESTAMP, ''::character varying, '');
INSERT INTO apolloportaldb.users
(id, username, "password", userdisplayname, email, enabled)
VALUES(nextval('users_id_seq'::regclass), 'default'::character varying, 'default'::character varying, 'default'::character varying, 'default'::character varying, 0);