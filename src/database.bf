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
	public struct mongoc_database_t;

	[CLink] public static extern char*  mongoc_database_get_name(mongoc_database_t* database);

	[CLink] public static extern bool mongoc_database_remove_user(mongoc_database_t* database, char* username, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_remove_all_users(mongoc_database_t* database, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_add_user(mongoc_database_t* database, char* username, char* password, bson_t* roles, bson_t* custom_data, bson_error_t* error);

	[CLink] public static extern void mongoc_database_destroy(mongoc_database_t* database);

	[CLink] public static extern mongoc_cursor_t* mongoc_database_aggregate(mongoc_database_t* db, bson_t* pipeline, bson_t* opts, mongoc_read_prefs_t* read_prefs); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_database_t* mongoc_database_copy(mongoc_database_t* database); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_cursor_t* mongoc_database_command(mongoc_database_t* database, mongoc_query_flags_t flags, uint32_t skip, uint32_t limit, uint32_t batch_size, bson_t* command, bson_t* fields, mongoc_read_prefs_t* read_prefs); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_database_command_simple);

	[CLink] public static extern bool mongoc_database_read_command_with_opts(mongoc_database_t* database, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_write_command_with_opts(mongoc_database_t* database, bson_t* command, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_read_write_command_with_opts(mongoc_database_t* database, bson_t* command, mongoc_read_prefs_t* read_prefs /* IGNORED */, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_command_with_opts(mongoc_database_t* database, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_command_simple(mongoc_database_t* database, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_drop(mongoc_database_t* database, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_drop_with_opts(mongoc_database_t* database, bson_t* opts, bson_error_t* error);

	[CLink] public static extern bool mongoc_database_has_collection(mongoc_database_t* database, char* name, bson_error_t* error);

	[CLink] public static extern mongoc_collection_t* mongoc_database_create_collection(mongoc_database_t* database, char* name, bson_t* options, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_read_prefs_t* mongoc_database_get_read_prefs(mongoc_database_t* database);

	[CLink] public static extern void mongoc_database_set_read_prefs(mongoc_database_t* database, mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern mongoc_write_concern_t* mongoc_database_get_write_concern(mongoc_database_t* database);

	[CLink] public static extern void mongoc_database_set_write_concern(mongoc_database_t* database, mongoc_write_concern_t* write_concern);

	[CLink] public static extern mongoc_read_concern_t* mongoc_database_get_read_concern(mongoc_database_t* database);

	[CLink] public static extern void mongoc_database_set_read_concern(mongoc_database_t* database, mongoc_read_concern_t* read_concern);

	[CLink] public static extern mongoc_cursor_t* mongoc_database_find_collections(mongoc_database_t* database, bson_t* filter, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_database_find_collections_with_opts);

	[CLink] public static extern mongoc_cursor_t* mongoc_database_find_collections_with_opts(mongoc_database_t* database, bson_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern char** mongoc_database_get_collection_names(mongoc_database_t* database, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_database_get_collection_names_with_opts);

	[CLink] public static extern char** mongoc_database_get_collection_names_with_opts(mongoc_database_t* database, bson_t* opts, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_collection_t* mongoc_database_get_collection(mongoc_database_t* database, char* name); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_change_stream_t* mongoc_database_watch(mongoc_database_t* db, bson_t* pipeline, bson_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;
}