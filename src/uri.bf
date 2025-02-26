/*
 * Copyright 2009-present MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

using System;
using static libbsonBeef.libbson;

namespace libmongocBeef;

extension libmongoc
{
	const int MONGOC_DEFAULT_PORT = 27017;

	const char* MONGOC_URI_APPNAME = "appname";
	const char* MONGOC_URI_AUTHMECHANISM = "authmechanism";
	const char* MONGOC_URI_AUTHMECHANISMPROPERTIES = "authmechanismproperties";
	const char* MONGOC_URI_AUTHSOURCE = "authsource";
	const char* MONGOC_URI_CANONICALIZEHOSTNAME = "canonicalizehostname";
	const char* MONGOC_URI_CONNECTTIMEOUTMS = "connecttimeoutms";
	const char* MONGOC_URI_COMPRESSORS = "compressors";
	const char* MONGOC_URI_DIRECTCONNECTION = "directconnection";
	const char* MONGOC_URI_GSSAPISERVICENAME = "gssapiservicename";
	const char* MONGOC_URI_HEARTBEATFREQUENCYMS = "heartbeatfrequencyms";
	const char* MONGOC_URI_JOURNAL = "journal";
	const char* MONGOC_URI_LOADBALANCED = "loadbalanced";
	const char* MONGOC_URI_LOCALTHRESHOLDMS = "localthresholdms";
	const char* MONGOC_URI_MAXIDLETIMEMS = "maxidletimems";
	const char* MONGOC_URI_MAXPOOLSIZE = "maxpoolsize";
	const char* MONGOC_URI_MAXSTALENESSSECONDS = "maxstalenessseconds";
	const char* MONGOC_URI_MINPOOLSIZE = "minpoolsize";
	const char* MONGOC_URI_READCONCERNLEVEL = "readconcernlevel";
	const char* MONGOC_URI_READPREFERENCE = "readpreference";
	const char* MONGOC_URI_READPREFERENCETAGS = "readpreferencetags";
	const char* MONGOC_URI_REPLICASET = "replicaset";
	const char* MONGOC_URI_RETRYREADS = "retryreads";
	const char* MONGOC_URI_RETRYWRITES = "retrywrites";
	const char* MONGOC_URI_SAFE = "safe";
	const char* MONGOC_URI_SERVERMONITORINGMODE = "servermonitoringmode";
	const char* MONGOC_URI_SERVERSELECTIONTIMEOUTMS = "serverselectiontimeoutms";
	const char* MONGOC_URI_SERVERSELECTIONTRYONCE = "serverselectiontryonce";
	const char* MONGOC_URI_SLAVEOK = "slaveok";
	const char* MONGOC_URI_SOCKETCHECKINTERVALMS = "socketcheckintervalms";
	const char* MONGOC_URI_SOCKETTIMEOUTMS = "sockettimeoutms";
	const char* MONGOC_URI_SRVSERVICENAME = "srvservicename";
	const char* MONGOC_URI_SRVMAXHOSTS = "srvmaxhosts";
	const char* MONGOC_URI_TLS = "tls";
	const char* MONGOC_URI_TLSCERTIFICATEKEYFILE = "tlscertificatekeyfile";
	const char* MONGOC_URI_TLSCERTIFICATEKEYFILEPASSWORD = "tlscertificatekeyfilepassword";
	const char* MONGOC_URI_TLSCAFILE = "tlscafile";
	const char* MONGOC_URI_TLSALLOWINVALIDCERTIFICATES = "tlsallowinvalidcertificates";
	const char* MONGOC_URI_TLSALLOWINVALIDHOSTNAMES = "tlsallowinvalidhostnames";
	const char* MONGOC_URI_TLSINSECURE = "tlsinsecure";
	const char* MONGOC_URI_TLSDISABLECERTIFICATEREVOCATIONCHECK = "tlsdisablecertificaterevocationcheck";
	const char* MONGOC_URI_TLSDISABLEOCSPENDPOINTCHECK = "tlsdisableocspendpointcheck";
	const char* MONGOC_URI_W = "w";
	const char* MONGOC_URI_WAITQUEUEMULTIPLE = "waitqueuemultiple";
	const char* MONGOC_URI_WAITQUEUETIMEOUTMS = "waitqueuetimeoutms";
	const char* MONGOC_URI_WTIMEOUTMS = "wtimeoutms";
	const char* MONGOC_URI_ZLIBCOMPRESSIONLEVEL = "zlibcompressionlevel";

	/* Deprecated in MongoDB 4.2, use "tls" variants instead. */
	const char* MONGOC_URI_SSL = "ssl";
	const char* MONGOC_URI_SSLCLIENTCERTIFICATEKEYFILE = "sslclientcertificatekeyfile";
	const char* MONGOC_URI_SSLCLIENTCERTIFICATEKEYPASSWORD = "sslclientcertificatekeypassword";
	const char* MONGOC_URI_SSLCERTIFICATEAUTHORITYFILE = "sslcertificateauthorityfile";
	const char* MONGOC_URI_SSLALLOWINVALIDCERTIFICATES = "sslallowinvalidcertificates";
	const char* MONGOC_URI_SSLALLOWINVALIDHOSTNAMES = "sslallowinvalidhostnames";

	public struct mongoc_uri_t { };

	[CLink] public static extern mongoc_uri_t*  mongoc_uri_copy(mongoc_uri_t* uri); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_uri_destroy(mongoc_uri_t* uri);

	[CLink] public static extern mongoc_uri_t*  mongoc_uri_new(char* uri_string); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_uri_t*  mongoc_uri_new_with_error(char* uri_string, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_uri_t*  mongoc_uri_new_for_host_port(char* hostname, uint16_t port); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_host_list_t* mongoc_uri_get_hosts(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_get_service(mongoc_uri_t* uri); // BSON_GNUC_DEPRECATED_FOR (mongoc_uri_get_srv_hostname);

	[CLink] public static extern char* mongoc_uri_get_srv_hostname(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_get_srv_service_name(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_get_database(mongoc_uri_t* uri);

	[CLink] public static extern bool mongoc_uri_set_database(mongoc_uri_t* uri, char* database);

	[CLink] public static extern bson_t* mongoc_uri_get_compressors(mongoc_uri_t* uri);

	[CLink] public static extern bson_t* mongoc_uri_get_options(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_get_password(mongoc_uri_t* uri);

	[CLink] public static extern bool mongoc_uri_set_password(mongoc_uri_t* uri, char* password);

	[CLink] public static extern bool mongoc_uri_has_option(mongoc_uri_t* uri, char* key);

	[CLink] public static extern bool mongoc_uri_option_is_int32(char* key);

	[CLink] public static extern bool mongoc_uri_option_is_int64(char* key);

	[CLink] public static extern bool mongoc_uri_option_is_bool(char* key);

	[CLink] public static extern bool mongoc_uri_option_is_utf8(char* key);

	[CLink] public static extern int32_t mongoc_uri_get_option_as_int32(mongoc_uri_t* uri, char* option, int32_t fallback);

	[CLink] public static extern int64_t mongoc_uri_get_option_as_int64(mongoc_uri_t* uri, char* option, int64_t fallback);

	[CLink] public static extern bool mongoc_uri_get_option_as_bool(mongoc_uri_t* uri, char* option, bool fallback);

	[CLink] public static extern char* mongoc_uri_get_option_as_utf8(mongoc_uri_t* uri, char* option, char* fallback);

	[CLink] public static extern bool mongoc_uri_set_option_as_int32(mongoc_uri_t* uri, char* option, int32_t value);

	[CLink] public static extern bool mongoc_uri_set_option_as_int64(mongoc_uri_t* uri, char* option, int64_t value);

	[CLink] public static extern bool mongoc_uri_set_option_as_bool(mongoc_uri_t* uri, char* option, bool value);

	[CLink] public static extern bool mongoc_uri_set_option_as_utf8(mongoc_uri_t* uri, char* option, char* value);

	[CLink] public static extern bson_t* mongoc_uri_get_read_prefs(mongoc_uri_t* uri); // BSON_GNUC_DEPRECATED_FOR (mongoc_uri_get_read_prefs_t);

	[CLink] public static extern char* mongoc_uri_get_replica_set(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_get_string(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_get_username(mongoc_uri_t* uri);

	[CLink] public static extern bool mongoc_uri_set_username(mongoc_uri_t* uri, char* username);

	[CLink] public static extern bson_t* mongoc_uri_get_credentials(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_get_auth_source(mongoc_uri_t* uri);

	[CLink] public static extern bool mongoc_uri_set_auth_source(mongoc_uri_t* uri, char* value);

	[CLink] public static extern char* mongoc_uri_get_appname(mongoc_uri_t* uri);

	[CLink] public static extern bool mongoc_uri_set_appname(mongoc_uri_t* uri, char* value);

	[CLink] public static extern bool mongoc_uri_set_compressors(mongoc_uri_t* uri, char* value);

	[CLink] public static extern char* mongoc_uri_get_auth_mechanism(mongoc_uri_t* uri);

	[CLink] public static extern bool mongoc_uri_set_auth_mechanism(mongoc_uri_t* uri, char* value);

	[CLink] public static extern bool mongoc_uri_get_mechanism_properties(mongoc_uri_t* uri, bson_t* properties);

	[CLink] public static extern bool mongoc_uri_set_mechanism_properties(mongoc_uri_t* uri, bson_t* properties);

	[CLink] public static extern bool mongoc_uri_get_ssl(mongoc_uri_t* uri); // BSON_GNUC_DEPRECATED_FOR (mongoc_uri_get_tls);

	[CLink] public static extern bool mongoc_uri_get_tls(mongoc_uri_t* uri);

	[CLink] public static extern char* mongoc_uri_unescape(char* escaped_string); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_read_prefs_t* mongoc_uri_get_read_prefs_t(mongoc_uri_t* uri);

	[CLink] public static extern void mongoc_uri_set_read_prefs_t(mongoc_uri_t* uri, mongoc_read_prefs_t* prefs);

	[CLink] public static extern mongoc_write_concern_t* mongoc_uri_get_write_concern(mongoc_uri_t* uri);

	[CLink] public static extern void mongoc_uri_set_write_concern(mongoc_uri_t* uri, mongoc_write_concern_t* wc);

	[CLink] public static extern mongoc_read_concern_t* mongoc_uri_get_read_concern(mongoc_uri_t* uri);

	[CLink] public static extern void mongoc_uri_set_read_concern(mongoc_uri_t* uri, mongoc_read_concern_t* rc);

	[CLink] public static extern char* mongoc_uri_get_server_monitoring_mode(mongoc_uri_t* uri);

	[CLink] public static extern bool mongoc_uri_set_server_monitoring_mode(mongoc_uri_t* uri, char* value);
}