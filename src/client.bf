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
using System.Interop;

namespace libmongocBeef;

using static libbsonBeef.libbson;

extension libmongoc
{
   /* This define is part of our public API. But per MongoDB 4.4, there is no
   * longer a size limit on collection names. */
	const int MONGOC_NAMESPACE_MAX = 128;


   #if !MONGOC_DEFAULT_CONNECTTIMEOUTMS
	const int MONGOC_DEFAULT_CONNECTTIMEOUTMS = (10 * 1000L);
   #endif


   // #if !MONGOC_DEFAULT_SOCKETTIMEOUTMS
   // /*
   //  * NOTE: The default socket timeout for connections is 5 minutes. This
   //  *       means that if your MongoDB server dies or becomes unavailable
   //  *       it will take 5 minutes to detect this.
   //  *
   //  *       You can change this by providing sockettimeoutms= in your
   //  *       connection URI.
   //  */
   // #define MONGOC_DEFAULT_SOCKETTIMEOUTMS (1000L * 60L * 5L)
   // #endif


   /**
   * mongoc_client_t:
   *
   * The mongoc_client_t structure maintains information about a connection to
   * a MongoDB server.
   */
	public struct mongoc_client_t;

	public struct mongoc_client_session_t;
	public struct mongoc_session_opt_t;
	public struct mongoc_transaction_opt_t;

	public struct mongoc_host_list_t;
	public struct mongoc_gridfs_t;

	/**
	* mongoc_stream_initiator_t:
	* @uri: The uri and options for the stream.
	* @host: The host and port (or UNIX domain socket path) to connect to.
	* @user_data: The pointer passed to mongoc_client_set_stream_initiator.
	* @error: A location for an error.
	*
	* Creates a new mongoc_stream_t for the host and port. Begin a
	* non-blocking connect and return immediately.
	*
	* This can be used by language bindings to create network transports other
	* than those built into libmongoc. An example of such would be the streams
	* API provided by PHP.
	*
	* Returns: A newly allocated mongoc_stream_t or NULL on failure.
	*/
	function mongoc_stream_t* mongoc_stream_initiator_t(mongoc_uri_t* uri, mongoc_host_list_t* host,  void* user_data, bson_error_t* error);


	[CLink] public static extern mongoc_client_t* mongoc_client_new(char* uri_string); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_client_t* mongoc_client_new_from_uri(mongoc_uri_t* uri); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_client_t* mongoc_client_new_from_uri_with_error(mongoc_uri_t* uri, bson_error_t* error); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_client_set_sockettimeoutms(mongoc_client_t* client, int32_t timeoutms);

	[CLink] public static extern mongoc_uri_t* mongoc_client_get_uri(mongoc_client_t* client);

	[CLink] public static extern void mongoc_client_set_stream_initiator(mongoc_client_t* client, mongoc_stream_initiator_t initiator, void* user_data);

	[CLink] public static extern mongoc_cursor_t* mongoc_client_command(mongoc_client_t* client, char* db_name, mongoc_query_flags_t flags, uint32_t skip, uint32_t limit, uint32_t batch_size, bson_t* query, bson_t* fields, mongoc_read_prefs_t* read_prefs); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_client_command_simple);

	[CLink] public static extern void mongoc_client_kill_cursor(mongoc_client_t* client, int64_t cursor_id); //BSON_GNUC_DEPRECATED;

	[CLink] public static extern bool mongoc_client_command_simple(mongoc_client_t* client, char* db_name, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_read_command_with_opts(mongoc_client_t* client, char* db_name, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_write_command_with_opts(mongoc_client_t* client, char* db_name, bson_t* command, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_read_write_command_with_opts(mongoc_client_t* client, char* db_name, bson_t* command, mongoc_read_prefs_t* read_prefs /* IGNORED */, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_command_with_opts(mongoc_client_t* client, char* db_name, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_command_simple_with_server_id(mongoc_client_t* client, char* db_name, bson_t* command, mongoc_read_prefs_t* read_prefs, uint32_t server_id, bson_t* reply, bson_error_t* error);

	[CLink] public static extern void mongoc_client_destroy(mongoc_client_t* client);

	[CLink] public static extern mongoc_client_session_t* mongoc_client_start_session(mongoc_client_t* client, mongoc_session_opt_t* opts, bson_error_t* error); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_database_t* mongoc_client_get_database(mongoc_client_t* client, char* name); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_database_t* mongoc_client_get_default_database(mongoc_client_t* client); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_gridfs_t* mongoc_client_get_gridfs(mongoc_client_t* client, char* db, char* prefix, bson_error_t* error); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_collection_t* mongoc_client_get_collection(mongoc_client_t* client, char* db, char* collection); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern char** mongoc_client_get_database_names(mongoc_client_t* client, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_client_get_database_names_with_opts);

	[CLink] public static extern char** mongoc_client_get_database_names_with_opts(mongoc_client_t* client, bson_t* opts, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_cursor_t* mongoc_client_find_databases(mongoc_client_t* client, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_client_find_databases_with_opts);

	[CLink] public static extern mongoc_cursor_t* mongoc_client_find_databases_with_opts(mongoc_client_t* client, bson_t* opts); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_client_get_server_status(mongoc_client_t* client, mongoc_read_prefs_t* read_prefs, bson_t* reply, bson_error_t* error); //BSON_GNUC_DEPRECATED;

	[CLink] public static extern int32_t mongoc_client_get_max_message_size(mongoc_client_t* client); //BSON_GNUC_DEPRECATED;

	[CLink] public static extern int32_t mongoc_client_get_max_bson_size(mongoc_client_t* client); //BSON_GNUC_DEPRECATED;

	[CLink] public static extern mongoc_write_concern_t* mongoc_client_get_write_concern(mongoc_client_t* client);

	[CLink] public static extern void mongoc_client_set_write_concern(mongoc_client_t* client, mongoc_write_concern_t* write_concern);

	[CLink] public static extern mongoc_read_concern_t* mongoc_client_get_read_concern(mongoc_client_t* client);

	[CLink] public static extern void mongoc_client_set_read_concern(mongoc_client_t* client, mongoc_read_concern_t* read_concern);

	[CLink] public static extern mongoc_read_prefs_t* mongoc_client_get_read_prefs(mongoc_client_t* client);

	[CLink] public static extern void mongoc_client_set_read_prefs(mongoc_client_t* client, mongoc_read_prefs_t* read_prefs);

#if MONGOC_ENABLE_SSL
   [CLink] public static extern void mongoc_client_set_ssl_opts (mongoc_client_t* client, mongoc_ssl_opt_t *opts);
#endif

	[CLink] public static extern bool mongoc_client_set_apm_callbacks(mongoc_client_t* client, mongoc_apm_callbacks_t* callbacks, void* context);

	[CLink] public static extern bool mongoc_client_set_structured_log_opts(mongoc_client_t* client, mongoc_structured_log_opts_t* opts);

	[CLink] public static extern mongoc_server_description_t* mongoc_client_get_server_description(mongoc_client_t* client, uint32_t server_id); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_server_description_t** mongoc_client_get_server_descriptions(mongoc_client_t* client, size_t* n); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_server_descriptions_destroy_all(mongoc_server_description_t** sds, size_t n);

	[CLink] public static extern mongoc_server_description_t* mongoc_client_select_server(mongoc_client_t* client, bool for_writes, mongoc_read_prefs_t* prefs, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_client_set_error_api(mongoc_client_t* client, int32_t version);

	[CLink] public static extern bool mongoc_client_set_appname(mongoc_client_t* client, char* appname);

	[CLink] public static extern mongoc_change_stream_t* mongoc_client_watch(mongoc_client_t* client, bson_t* pipeline, bson_t* opts); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_client_reset(mongoc_client_t* client);

	[CLink] public static extern bool mongoc_client_enable_auto_encryption(mongoc_client_t* client, mongoc_auto_encryption_opts_t* opts, bson_error_t* error);

	[CLink] public static extern char* mongoc_client_get_crypt_shared_version(mongoc_client_t* client); //BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_client_set_server_api(mongoc_client_t* client, mongoc_server_api_t* api, bson_error_t* error);

	[CLink] public static extern mongoc_server_description_t* mongoc_client_get_handshake_description(mongoc_client_t* client, uint32_t server_id, bson_t* opts, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;
}