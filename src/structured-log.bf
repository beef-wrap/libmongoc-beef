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
using static libbson.libbson;

namespace libmongoc;

extension libmongoc
{
	public enum mongoc_structured_log_level_t : c_int
	{
		MONGOC_STRUCTURED_LOG_LEVEL_EMERGENCY = 0,
		MONGOC_STRUCTURED_LOG_LEVEL_ALERT = 1,
		MONGOC_STRUCTURED_LOG_LEVEL_CRITICAL = 2,
		MONGOC_STRUCTURED_LOG_LEVEL_ERROR = 3,
		MONGOC_STRUCTURED_LOG_LEVEL_WARNING = 4,
		MONGOC_STRUCTURED_LOG_LEVEL_NOTICE = 5,
		MONGOC_STRUCTURED_LOG_LEVEL_INFO = 6,
		MONGOC_STRUCTURED_LOG_LEVEL_DEBUG = 7,
		MONGOC_STRUCTURED_LOG_LEVEL_TRACE = 8,
	}

	public enum mongoc_structured_log_component_t : c_int
	{
		MONGOC_STRUCTURED_LOG_COMPONENT_COMMAND = 0,
		MONGOC_STRUCTURED_LOG_COMPONENT_TOPOLOGY = 1,
		MONGOC_STRUCTURED_LOG_COMPONENT_SERVER_SELECTION = 2,
		MONGOC_STRUCTURED_LOG_COMPONENT_CONNECTION = 3,
	}

	public struct mongoc_structured_log_entry_t;

	public struct mongoc_structured_log_opts_t;

	function void mongoc_structured_log_func_t(mongoc_structured_log_entry_t* entry, void* user_data);

	[CLink] public static extern mongoc_structured_log_opts_t*  mongoc_structured_log_opts_new();

	[CLink] public static extern void mongoc_structured_log_opts_destroy(mongoc_structured_log_opts_t* opts);

	[CLink] public static extern void mongoc_structured_log_opts_set_handler(mongoc_structured_log_opts_t* opts, mongoc_structured_log_func_t log_func, void* user_data);

	[CLink] public static extern bool mongoc_structured_log_opts_set_max_level_for_component(mongoc_structured_log_opts_t* opts, mongoc_structured_log_component_t component, mongoc_structured_log_level_t level);

	[CLink] public static extern bool mongoc_structured_log_opts_set_max_level_for_all_components(mongoc_structured_log_opts_t* opts, mongoc_structured_log_level_t level);

	[CLink] public static extern bool mongoc_structured_log_opts_set_max_levels_from_env(mongoc_structured_log_opts_t* opts);

	[CLink] public static extern mongoc_structured_log_level_t mongoc_structured_log_opts_get_max_level_for_component(mongoc_structured_log_opts_t* opts, mongoc_structured_log_component_t component);

	[CLink] public static extern size_t mongoc_structured_log_opts_get_max_document_length(mongoc_structured_log_opts_t* opts);

	[CLink] public static extern bool mongoc_structured_log_opts_set_max_document_length_from_env(mongoc_structured_log_opts_t* opts);

	[CLink] public static extern bool mongoc_structured_log_opts_set_max_document_length(mongoc_structured_log_opts_t* opts, size_t max_document_length);

	[CLink] public static extern bson_t*  mongoc_structured_log_entry_message_as_bson(mongoc_structured_log_entry_t* entry);

	[CLink] public static extern mongoc_structured_log_level_t mongoc_structured_log_entry_get_level(mongoc_structured_log_entry_t* entry);

	[CLink] public static extern mongoc_structured_log_component_t mongoc_structured_log_entry_get_component(mongoc_structured_log_entry_t* entry);

	[CLink] public static extern char*  mongoc_structured_log_entry_get_message_string(mongoc_structured_log_entry_t* entry);

	[CLink] public static extern char*  mongoc_structured_log_get_level_name(mongoc_structured_log_level_t level);

	[CLink] public static extern bool mongoc_structured_log_get_named_level(char* name, mongoc_structured_log_level_t* out_);

	[CLink] public static extern char*  mongoc_structured_log_get_component_name(mongoc_structured_log_component_t component);

	[CLink] public static extern bool mongoc_structured_log_get_named_component(char* name, mongoc_structured_log_component_t* out_);

}
