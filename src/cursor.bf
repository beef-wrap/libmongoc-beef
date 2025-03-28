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

namespace libmongoc;

using static libbson.libbson;

extension libmongoc
{
	public struct mongoc_cursor_t;

	[CLink] public static extern mongoc_cursor_t* mongoc_cursor_clone(mongoc_cursor_t* cursor); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_cursor_destroy(mongoc_cursor_t* cursor);

	[CLink] public static extern bool mongoc_cursor_more(mongoc_cursor_t* cursor);

	[CLink] public static extern bool mongoc_cursor_next(mongoc_cursor_t* cursor, bson_t** bson);

	[CLink] public static extern bool mongoc_cursor_error(mongoc_cursor_t* cursor, bson_error_t* error);

	[CLink] public static extern bool mongoc_cursor_error_document(mongoc_cursor_t* cursor, bson_error_t* error, bson_t** doc);

	[CLink] public static extern void mongoc_cursor_get_host(mongoc_cursor_t* cursor, mongoc_host_list_t* host);

	[CLink] public static extern bool mongoc_cursor_is_alive(mongoc_cursor_t* cursor); // BSON_GNUC_DEPRECATED_FOR (mongoc_cursor_more);

	[CLink] public static extern bson_t*  mongoc_cursor_current(mongoc_cursor_t* cursor);

	[CLink] public static extern void mongoc_cursor_set_batch_size(mongoc_cursor_t* cursor, uint32_t batch_size);

	[CLink] public static extern uint32_t mongoc_cursor_get_batch_size(mongoc_cursor_t* cursor);

	[CLink] public static extern bool mongoc_cursor_set_limit(mongoc_cursor_t* cursor, int64_t limit);

	[CLink] public static extern int64_t mongoc_cursor_get_limit(mongoc_cursor_t* cursor);

	[CLink] public static extern bool mongoc_cursor_set_server_id(mongoc_cursor_t* cursor, uint32_t server_id);

	[CLink] public static extern uint32_t mongoc_cursor_get_server_id(mongoc_cursor_t* cursor);

	[CLink] public static extern int64_t mongoc_cursor_get_id(mongoc_cursor_t* cursor);

	[CLink] public static extern void mongoc_cursor_set_max_await_time_ms(mongoc_cursor_t* cursor, uint32_t max_await_time_ms);

	[CLink] public static extern uint32_t mongoc_cursor_get_max_await_time_ms(mongoc_cursor_t* cursor);

	[CLink] public static extern mongoc_cursor_t*  mongoc_cursor_new_from_command_reply(mongoc_client_t* client, bson_t* reply, uint32_t server_id); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_cursor_new_from_command_reply_with_opts);

	[CLink] public static extern mongoc_cursor_t*  mongoc_cursor_new_from_command_reply_with_opts(mongoc_client_t* client, bson_t* reply, bson_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	// `mongoc_cursor_set_hint` is deprecated for more aptly named `mongoc_cursor_set_server_id`.
	[CLink] public static extern bool mongoc_cursor_set_hint(mongoc_cursor_t* cursor, uint32_t server_id); // BSON_GNUC_DEPRECATED_FOR (mongoc_cursor_set_server_id);
   
	// `mongoc_cursor_get_hint` is deprecated for more aptly named `mongoc_cursor_get_server_id`.
	[CLink] public static extern uint32_t mongoc_cursor_get_hint(mongoc_cursor_t* cursor); // BSON_GNUC_DEPRECATED_FOR (mongoc_cursor_get_server_id);
}