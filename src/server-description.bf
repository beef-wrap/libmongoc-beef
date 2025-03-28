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
using static libbson.libbson;

namespace libmongoc;

extension libmongoc
{
	public struct mongoc_server_description_t;

	[CLink] public static extern void mongoc_server_description_destroy(mongoc_server_description_t* description);

	[CLink] public static extern mongoc_server_description_t* mongoc_server_description_new_copy(mongoc_server_description_t* description); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern uint32_t mongoc_server_description_id(mongoc_server_description_t* description);

	[CLink] public static extern mongoc_host_list_t* mongoc_server_description_host(mongoc_server_description_t* description);

	[CLink] public static extern int64_t mongoc_server_description_last_update_time(mongoc_server_description_t* description);

	[CLink] public static extern int64_t mongoc_server_description_round_trip_time(mongoc_server_description_t* description);

	[CLink] public static extern char*  mongoc_server_description_type(mongoc_server_description_t* description);

	[CLink] public static extern bson_t* mongoc_server_description_hello_response(mongoc_server_description_t* description);

	[CLink] public static extern bson_t* mongoc_server_description_ismaster(mongoc_server_description_t* description); // BSON_GNUC_DEPRECATED_FOR (mongoc_server_description_hello_response);

	[CLink] public static extern int32_t mongoc_server_description_compressor_id(mongoc_server_description_t* description);
}