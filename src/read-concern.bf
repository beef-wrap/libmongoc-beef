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
	const char* MONGOC_READ_CONCERN_LEVEL_AVAILABLE = "available";
	const char* MONGOC_READ_CONCERN_LEVEL_LOCAL = "local";
	const char* MONGOC_READ_CONCERN_LEVEL_MAJORITY = "majority";
	const char* MONGOC_READ_CONCERN_LEVEL_LINEARIZABLE = "linearizable";
	const char* MONGOC_READ_CONCERN_LEVEL_SNAPSHOT = "snapshot";

	public struct mongoc_read_concern_t;

	[CLink] public static extern mongoc_read_concern_t* mongoc_read_concern_new(); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_read_concern_t* mongoc_read_concern_copy(mongoc_read_concern_t* read_concern); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_read_concern_destroy(mongoc_read_concern_t* read_concern);

	[CLink] public static extern char*  mongoc_read_concern_get_level(mongoc_read_concern_t* read_concern);

	[CLink] public static extern bool mongoc_read_concern_set_level(mongoc_read_concern_t* read_concern, char* level);

	[CLink] public static extern bool mongoc_read_concern_append(mongoc_read_concern_t* read_concern, bson_t* doc);

	[CLink] public static extern bool mongoc_read_concern_is_default(mongoc_read_concern_t* read_concern);
}