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
	public enum mongoc_find_and_modify_flags_t
	{
		MONGOC_FIND_AND_MODIFY_NONE = 0,
		MONGOC_FIND_AND_MODIFY_REMOVE = 1 << 0,
		MONGOC_FIND_AND_MODIFY_UPSERT = 1 << 1,
		MONGOC_FIND_AND_MODIFY_RETURN_NEW = 1 << 2,
	}

	public struct mongoc_find_and_modify_opts_t;

	[CLink] public static extern mongoc_find_and_modify_opts_t*  mongoc_find_and_modify_opts_new(void); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_find_and_modify_opts_set_sort(mongoc_find_and_modify_opts_t* opts, bson_t* sort);

	[CLink] public static extern void mongoc_find_and_modify_opts_get_sort(mongoc_find_and_modify_opts_t* opts, bson_t* sort);

	[CLink] public static extern bool mongoc_find_and_modify_opts_set_update(mongoc_find_and_modify_opts_t* opts, bson_t* update);

	[CLink] public static extern void mongoc_find_and_modify_opts_get_update(mongoc_find_and_modify_opts_t* opts, bson_t* update);

	[CLink] public static extern bool mongoc_find_and_modify_opts_set_fields(mongoc_find_and_modify_opts_t* opts, bson_t* fields);

	[CLink] public static extern void mongoc_find_and_modify_opts_get_fields(mongoc_find_and_modify_opts_t* opts, bson_t* fields);

	[CLink] public static extern bool mongoc_find_and_modify_opts_set_flags(mongoc_find_and_modify_opts_t* opts, mongoc_find_and_modify_flags_t flags);

	[CLink] public static extern mongoc_find_and_modify_flags_t mongoc_find_and_modify_opts_get_flags(mongoc_find_and_modify_opts_t* opts);

	[CLink] public static extern bool mongoc_find_and_modify_opts_set_bypass_document_validation(mongoc_find_and_modify_opts_t* opts, bool bypass);

	[CLink] public static extern bool mongoc_find_and_modify_opts_get_bypass_document_validation(mongoc_find_and_modify_opts_t* opts);

	[CLink] public static extern bool mongoc_find_and_modify_opts_set_max_time_ms(mongoc_find_and_modify_opts_t* opts, uint32_t max_time_ms);

	[CLink] public static extern uint32_t mongoc_find_and_modify_opts_get_max_time_ms(mongoc_find_and_modify_opts_t* opts);

	[CLink] public static extern bool mongoc_find_and_modify_opts_append(mongoc_find_and_modify_opts_t* opts, bson_t* extra);

	[CLink] public static extern void mongoc_find_and_modify_opts_get_extra(mongoc_find_and_modify_opts_t* opts, bson_t* extra);

	[CLink] public static extern void mongoc_find_and_modify_opts_destroy(mongoc_find_and_modify_opts_t* opts);
}