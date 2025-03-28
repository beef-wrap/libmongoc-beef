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
	public struct mongoc_gridfs_bucket_t;

	[CLink] public static extern mongoc_gridfs_bucket_t* mongoc_gridfs_bucket_new(mongoc_database_t* db, bson_t* opts, mongoc_read_prefs_t* read_prefs, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_stream_t* mongoc_gridfs_bucket_open_upload_stream(mongoc_gridfs_bucket_t* bucket, char* filename, bson_t* opts, bson_value_t* file_id, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_stream_t* mongoc_gridfs_bucket_open_upload_stream_with_id(mongoc_gridfs_bucket_t* bucket, bson_value_t* file_id, char* filename, bson_t* opts, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_gridfs_bucket_upload_from_stream(mongoc_gridfs_bucket_t* bucket, char* filename, mongoc_stream_t* source, bson_t* opts, bson_value_t* file_id, bson_error_t* error);

	[CLink] public static extern bool mongoc_gridfs_bucket_upload_from_stream_with_id(mongoc_gridfs_bucket_t* bucket, bson_value_t* file_id, char* filename, mongoc_stream_t* source, bson_t* opts, bson_error_t* error);

	[CLink] public static extern mongoc_stream_t* mongoc_gridfs_bucket_open_download_stream(mongoc_gridfs_bucket_t* bucket, bson_value_t* file_id, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_gridfs_bucket_download_to_stream(mongoc_gridfs_bucket_t* bucket, bson_value_t* file_id, mongoc_stream_t* destination, bson_error_t* error);

	[CLink] public static extern bool mongoc_gridfs_bucket_delete_by_id(mongoc_gridfs_bucket_t* bucket, bson_value_t* file_id, bson_error_t* error);

	[CLink] public static extern mongoc_cursor_t* mongoc_gridfs_bucket_find(mongoc_gridfs_bucket_t* bucket, bson_t* filter, bson_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern bool mongoc_gridfs_bucket_stream_error(mongoc_stream_t* stream, bson_error_t* error);

	[CLink] public static extern void mongoc_gridfs_bucket_destroy(mongoc_gridfs_bucket_t* bucket);

	[CLink] public static extern bool mongoc_gridfs_bucket_abort_upload(mongoc_stream_t* stream);
}