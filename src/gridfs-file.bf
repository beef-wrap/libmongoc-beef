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
   // #define MONGOC_GRIDFS_FILE_STR_HEADER(name)                    \
   //    [CLink] public static extern (char* )                                \
   //   mongoc_gridfs_file_get_##name (mongoc_gridfs_file_t file); \
   //    [CLink] public static extern (void)                                        \
   //   mongoc_gridfs_file_set_##name (mongoc_gridfs_file_t file, char* str);


   // #define MONGOC_GRIDFS_FILE_BSON_HEADER(name)                   \
   //    [CLink] public static extern (bson_t *)                              \
   //   mongoc_gridfs_file_get_##name (mongoc_gridfs_file_t file); \
   //    [CLink] public static extern (void)                                        \
   //   mongoc_gridfs_file_set_##name (mongoc_gridfs_file_t file, bson_t *bson);


	public struct mongoc_gridfs_file_t;
	public struct mongoc_gridfs_file_opt_t;

	[CRepr]
	public struct _mongoc_gridfs_file_opt_t
	{
		char* md5;
		char* filename;
		char* content_type;
		bson_t* aliases;
		bson_t* metadata;
		uint32_t chunk_size;
	}

	// MONGOC_GRIDFS_FILE_STR_HEADER (md5)
	// MONGOC_GRIDFS_FILE_STR_HEADER (filename)
	// MONGOC_GRIDFS_FILE_STR_HEADER (content_type)
	// MONGOC_GRIDFS_FILE_BSON_HEADER (aliases)
	// MONGOC_GRIDFS_FILE_BSON_HEADER (metadata)

	[CLink] public static extern bson_value_t* mongoc_gridfs_file_get_id(mongoc_gridfs_file_t* file);

	[CLink] public static extern int64_t mongoc_gridfs_file_get_length(mongoc_gridfs_file_t* file);

	[CLink] public static extern int32_t mongoc_gridfs_file_get_chunk_size(mongoc_gridfs_file_t* file);

	[CLink] public static extern int64_t mongoc_gridfs_file_get_upload_date(mongoc_gridfs_file_t* file);

	[CLink] public static extern ssize_t mongoc_gridfs_file_writev(mongoc_gridfs_file_t* file, mongoc_iovec_t* iov, size_t iovcnt, uint32_t timeout_msec);

	[CLink] public static extern ssize_t mongoc_gridfs_file_readv(mongoc_gridfs_file_t* file, mongoc_iovec_t* iov, size_t iovcnt, size_t min_bytes, uint32_t timeout_msec);

	[CLink] public static extern int mongoc_gridfs_file_seek(mongoc_gridfs_file_t* file, int64_t delta, int whence);

	[CLink] public static extern uint64_t mongoc_gridfs_file_tell(mongoc_gridfs_file_t* file);

	[CLink] public static extern bool mongoc_gridfs_file_set_id(mongoc_gridfs_file_t* file, bson_value_t* id, bson_error_t* error);

	[CLink] public static extern bool mongoc_gridfs_file_save(mongoc_gridfs_file_t* file);

	[CLink] public static extern void mongoc_gridfs_file_destroy(mongoc_gridfs_file_t* file);

	[CLink] public static extern bool mongoc_gridfs_file_error(mongoc_gridfs_file_t* file, bson_error_t* error);

	[CLink] public static extern bool mongoc_gridfs_file_remove(mongoc_gridfs_file_t* file, bson_error_t* error);
}