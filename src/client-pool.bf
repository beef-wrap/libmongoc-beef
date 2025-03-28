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
	public struct mongoc_client_pool_t;

	[CLink] public static extern mongoc_client_pool_t* mongoc_client_pool_new(mongoc_uri_t* uri); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_client_pool_t* mongoc_client_pool_new_with_error(mongoc_uri_t* uri, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_client_pool_destroy(mongoc_client_pool_t* pool);

	[CLink] public static extern mongoc_client_t* mongoc_client_pool_pop(mongoc_client_pool_t* pool); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_client_pool_push(mongoc_client_pool_t* pool, mongoc_client_t* client);

	[CLink] public static extern mongoc_client_t* mongoc_client_pool_try_pop(mongoc_client_pool_t* pool); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_client_pool_max_size(mongoc_client_pool_t* pool, uint32_t max_pool_size);

	[CLink] public static extern void mongoc_client_pool_min_size(mongoc_client_pool_t* pool, uint32_t min_pool_size); // BSON_GNUC_DEPRECATED;

#if MONGOC_ENABLE_SSL
	[CLink] public static extern void mongoc_client_pool_set_ssl_opts(mongoc_client_pool_t* pool, mongoc_ssl_opt_t* opts);
#endif

	[CLink] public static extern bool mongoc_client_pool_set_apm_callbacks(mongoc_client_pool_t* pool, mongoc_apm_callbacks_t* callbacks, void* context);

	[CLink] public static extern bool mongoc_client_pool_set_error_api(mongoc_client_pool_t* pool, int32_t version);

	[CLink] public static extern bool mongoc_client_pool_set_appname(mongoc_client_pool_t* pool, char* appname);

	[CLink] public static extern bool mongoc_client_pool_enable_auto_encryption(mongoc_client_pool_t* pool, mongoc_auto_encryption_opts_t* opts, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_pool_set_server_api(mongoc_client_pool_t* pool, mongoc_server_api_t* api, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_pool_set_structured_log_opts(mongoc_client_pool_t* pool, mongoc_structured_log_opts_t* opts);
}