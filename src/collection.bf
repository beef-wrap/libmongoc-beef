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
 * distributed under the License is distributed on an "AS IS" BASIS, * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


using System;
using System.Interop;

namespace libmongoc;

using static libbson.libbson;

extension libmongoc
{
	public struct mongoc_collection_t;

	[CLink] public static extern mongoc_cursor_t*  mongoc_collection_aggregate(mongoc_collection_t* collection, mongoc_query_flags_t flags, bson_t* pipeline, bson_t* opts, mongoc_read_prefs_t* read_prefs); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_collection_destroy(mongoc_collection_t* collection);

	[CLink] public static extern mongoc_collection_t*  mongoc_collection_copy(mongoc_collection_t* collection); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_cursor_t*  mongoc_collection_command(mongoc_collection_t* collection, mongoc_query_flags_t flags, uint32_t skip, uint32_t limit, uint32_t batch_size, bson_t* command, bson_t* fields, mongoc_read_prefs_t* read_prefs); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_collection_command_simple);

	[CLink] public static extern bool mongoc_collection_read_command_with_opts(mongoc_collection_t* collection, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_write_command_with_opts(mongoc_collection_t* collection, bson_t* command, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_read_write_command_with_opts(mongoc_collection_t* collection, bson_t* command, mongoc_read_prefs_t* read_prefs /* IGNORED */, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_command_with_opts(mongoc_collection_t* collection, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_command_simple(mongoc_collection_t* collection, bson_t* command, mongoc_read_prefs_t* read_prefs, bson_t* reply, bson_error_t* error);

	[CLink] public static extern int64_t mongoc_collection_count(mongoc_collection_t* collection, mongoc_query_flags_t flags, bson_t* query, int64_t skip, int64_t limit, mongoc_read_prefs_t* read_prefs, bson_error_t* error); // BSON_GNUC_DEPRECATED_FOR (mongoc_collection_count_documents or mongoc_collection_estimated_document_count);

	[CLink] public static extern int64_t mongoc_collection_count_with_opts(mongoc_collection_t* collection, mongoc_query_flags_t flags, bson_t* query, int64_t skip, int64_t limit, bson_t* opts, mongoc_read_prefs_t* read_prefs, bson_error_t* error); // BSON_GNUC_DEPRECATED_FOR (mongoc_collection_count_documents or mongoc_collection_estimated_document_count);

	[CLink] public static extern bool mongoc_collection_drop(mongoc_collection_t* collection, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_drop_with_opts(mongoc_collection_t* collection, bson_t* opts, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_drop_index(mongoc_collection_t* collection, char* index_name, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_drop_index_with_opts(mongoc_collection_t* collection, char* index_name, bson_t* opts, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_create_index(mongoc_collection_t* collection, bson_t* keys, mongoc_index_opt_t* opt, bson_error_t* error); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern bool mongoc_collection_create_index_with_opts(mongoc_collection_t* collection, bson_t* keys, mongoc_index_opt_t* opt, bson_t* opts, bson_t* reply, bson_error_t* error); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern bool mongoc_collection_ensure_index(mongoc_collection_t* collection, bson_t* keys, mongoc_index_opt_t* opt, bson_error_t* error); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern mongoc_cursor_t*  mongoc_collection_find_indexes(mongoc_collection_t* collection, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_collection_find_indexes_with_opts);

	[CLink] public static extern mongoc_cursor_t*  mongoc_collection_find_indexes_with_opts(mongoc_collection_t* collection, bson_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	public struct mongoc_index_model_t;

	[CLink] public static extern mongoc_index_model_t*  mongoc_index_model_new(bson_t* keys, bson_t* opts);

	[CLink] public static extern void mongoc_index_model_destroy(mongoc_index_model_t* model);

	[CLink] public static extern bool mongoc_collection_create_indexes_with_opts(mongoc_collection_t* collection, mongoc_index_model_t** models, size_t n_models, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern mongoc_cursor_t*  mongoc_collection_find(mongoc_collection_t* collection, mongoc_query_flags_t flags, uint32_t skip, uint32_t limit, uint32_t batch_size, bson_t* query, bson_t* fields, mongoc_read_prefs_t* read_prefs); // BSON_GNUC_DEPRECATED_FOR (mongoc_collection_find_with_opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_cursor_t*  mongoc_collection_find_with_opts(mongoc_collection_t* collection, bson_t* filter, bson_t* opts, mongoc_read_prefs_t* read_prefs); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_collection_insert(mongoc_collection_t* collection, mongoc_insert_flags_t flags, bson_t* document, mongoc_write_concern_t* write_concern, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_insert_one(mongoc_collection_t* collection, bson_t* document, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_insert_many(mongoc_collection_t* collection, bson_t** documents, size_t n_documents, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_insert_bulk(mongoc_collection_t* collection, mongoc_insert_flags_t flags, bson_t** documents, uint32_t n_documents, mongoc_write_concern_t* write_concern, bson_error_t* error); // BSON_GNUC_DEPRECATED_FOR (mongoc_collection_insert_many);

	[CLink] public static extern bool mongoc_collection_update(mongoc_collection_t* collection, mongoc_update_flags_t flags, bson_t* selector, bson_t* update, mongoc_write_concern_t* write_concern, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_update_one(mongoc_collection_t* collection, bson_t* selector, bson_t* update, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_update_many(mongoc_collection_t* collection, bson_t* selector, bson_t* update, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_replace_one(mongoc_collection_t* collection, bson_t* selector, bson_t* replacement, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_delete(mongoc_collection_t* collection, mongoc_delete_flags_t flags, bson_t* selector, mongoc_write_concern_t* write_concern, bson_error_t* error); // BSON_GNUC_DEPRECATED_FOR (mongoc_collection_delete_one or mongoc_collection_delete_many);

	[CLink] public static extern bool mongoc_collection_save(mongoc_collection_t* collection, bson_t* document, mongoc_write_concern_t* write_concern, bson_error_t* error); // BSON_GNUC_DEPRECATED_FOR (mongoc_collection_insert_one or mongoc_collection_replace_one);

	[CLink] public static extern bool mongoc_collection_remove(mongoc_collection_t* collection, mongoc_remove_flags_t flags, bson_t* selector, mongoc_write_concern_t* write_concern, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_delete_one(mongoc_collection_t* collection, bson_t* selector, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_delete_many(mongoc_collection_t* collection, bson_t* selector, bson_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_rename(mongoc_collection_t* collection, char* new_db, char* new_name, bool drop_target_before_rename, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_rename_with_opts(mongoc_collection_t* collection, char* new_db, char* new_name, bool drop_target_before_rename, bson_t* opts, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_find_and_modify_with_opts(mongoc_collection_t* collection, bson_t* query, mongoc_find_and_modify_opts_t* opts, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_find_and_modify(mongoc_collection_t* collection, bson_t* query, bson_t* sort, bson_t* update, bson_t* fields, bool _remove, bool upsert, bool _new, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_collection_stats(mongoc_collection_t* collection, bson_t* options, bson_t* reply, bson_error_t* error); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern mongoc_bulk_operation_t*  mongoc_collection_create_bulk_operation(mongoc_collection_t* collection, bool ordered, mongoc_write_concern_t* write_concern); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_collection_create_bulk_operation_with_opts);

	[CLink] public static extern mongoc_bulk_operation_t*  mongoc_collection_create_bulk_operation_with_opts(mongoc_collection_t* collection, bson_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_read_prefs_t*  mongoc_collection_get_read_prefs(mongoc_collection_t* collection);

	[CLink] public static extern void mongoc_collection_set_read_prefs(mongoc_collection_t* collection, mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern mongoc_read_concern_t*  mongoc_collection_get_read_concern(mongoc_collection_t* collection);

	[CLink] public static extern void mongoc_collection_set_read_concern(mongoc_collection_t* collection, mongoc_read_concern_t* read_concern);

	[CLink] public static extern mongoc_write_concern_t*  mongoc_collection_get_write_concern(mongoc_collection_t* collection);

	[CLink] public static extern void mongoc_collection_set_write_concern(mongoc_collection_t* collection, mongoc_write_concern_t* write_concern);

	[CLink] public static extern char*  mongoc_collection_get_name(mongoc_collection_t* collection);

	[CLink] public static extern bson_t*  mongoc_collection_get_last_error(mongoc_collection_t* collection); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern char*  mongoc_collection_keys_to_index_string(bson_t* keys); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_collection_validate(mongoc_collection_t* collection, bson_t* options, bson_t* reply, bson_error_t* error); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern mongoc_change_stream_t*  mongoc_collection_watch(mongoc_collection_t* coll, bson_t* pipeline, bson_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern int64_t mongoc_collection_count_documents(mongoc_collection_t* coll, bson_t* filter, bson_t* opts, mongoc_read_prefs_t* read_prefs, bson_t* reply, bson_error_t* error);

	[CLink] public static extern int64_t mongoc_collection_estimated_document_count(mongoc_collection_t* coll, bson_t* opts, mongoc_read_prefs_t* read_prefs, bson_t* reply, bson_error_t* error);
}