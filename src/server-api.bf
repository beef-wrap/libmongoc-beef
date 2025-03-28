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
	public enum mongoc_server_api_version_t  : c_int
	{
		MONGOC_SERVER_API_V1
	}

	public struct mongoc_server_api_t;

	[CLink] public static extern char* mongoc_server_api_version_to_string(mongoc_server_api_version_t version);

	[CLink] public static extern bool mongoc_server_api_version_from_string(char* version, mongoc_server_api_version_t* out_);

	[CLink] public static extern mongoc_server_api_t* mongoc_server_api_new(mongoc_server_api_version_t version); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_server_api_t* mongoc_server_api_copy(mongoc_server_api_t* api); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_server_api_destroy(mongoc_server_api_t* api);

	[CLink] public static extern void mongoc_server_api_strict(mongoc_server_api_t* api, bool strict);

	[CLink] public static extern void mongoc_server_api_deprecation_errors(mongoc_server_api_t* api, bool deprecation_errors);

	[CLink] public static extern mongoc_optional_t* mongoc_server_api_get_deprecation_errors(mongoc_server_api_t* api);

	[CLink] public static extern mongoc_optional_t* mongoc_server_api_get_strict(mongoc_server_api_t* api);

	[CLink] public static extern mongoc_server_api_version_t mongoc_server_api_get_version(mongoc_server_api_t* api);
}