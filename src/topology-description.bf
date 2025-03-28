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

extension libmongoc
{
	public struct mongoc_topology_description_t;

	[CLink] public static extern void mongoc_topology_description_destroy(mongoc_topology_description_t* description);

	[CLink] public static extern mongoc_topology_description_t* mongoc_topology_description_new_copy(mongoc_topology_description_t* description); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_topology_description_has_readable_server(mongoc_topology_description_t* td, mongoc_read_prefs_t* prefs);

	[CLink] public static extern bool mongoc_topology_description_has_writable_server(mongoc_topology_description_t* td);

	[CLink] public static extern char*  mongoc_topology_description_type(mongoc_topology_description_t* td);

	[CLink] public static extern mongoc_server_description_t** mongoc_topology_description_get_servers(mongoc_topology_description_t* td, size_t* n); // BSON_GNUC_WARN_UNUSED_RESULT;
}
