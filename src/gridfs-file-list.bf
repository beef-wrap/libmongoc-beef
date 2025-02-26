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
	public struct mongoc_gridfs_file_list_t;

	[CLink] public static extern mongoc_gridfs_file_t* mongoc_gridfs_file_list_next(mongoc_gridfs_file_list_t* list); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_gridfs_file_list_destroy(mongoc_gridfs_file_list_t* list);

	[CLink] public static extern bool mongoc_gridfs_file_list_error(mongoc_gridfs_file_list_t* list, bson_error_t* error);
}