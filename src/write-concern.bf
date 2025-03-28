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
	const int MONGOC_WRITE_CONCERN_W_UNACKNOWLEDGED =  0;
	const int MONGOC_WRITE_CONCERN_W_ERRORS_IGNORED =  -1; /* deprecated */
	const int MONGOC_WRITE_CONCERN_W_DEFAULT =  -2;
	const int MONGOC_WRITE_CONCERN_W_MAJORITY =  -3;
	const int MONGOC_WRITE_CONCERN_W_TAG =  -4;

	public struct mongoc_write_concern_t;

	[CLink] public static extern mongoc_write_concern_t* mongoc_write_concern_new(); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_write_concern_t* mongoc_write_concern_copy(mongoc_write_concern_t* write_concern); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_write_concern_destroy(mongoc_write_concern_t* write_concern);

	[CLink] public static extern bool mongoc_write_concern_get_fsync(mongoc_write_concern_t* write_concern); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern void mongoc_write_concern_set_fsync(mongoc_write_concern_t* write_concern, bool fsync_); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern bool mongoc_write_concern_get_journal(mongoc_write_concern_t* write_concern);

	[CLink] public static extern bool mongoc_write_concern_journal_is_set(mongoc_write_concern_t* write_concern);

	[CLink] public static extern void mongoc_write_concern_set_journal(mongoc_write_concern_t* write_concern, bool journal);

	[CLink] public static extern int32_t mongoc_write_concern_get_w(mongoc_write_concern_t* write_concern);

	[CLink] public static extern void mongoc_write_concern_set_w(mongoc_write_concern_t* write_concern, int32_t w);

	[CLink] public static extern char*  mongoc_write_concern_get_wtag(mongoc_write_concern_t* write_concern);

	[CLink] public static extern void mongoc_write_concern_set_wtag(mongoc_write_concern_t* write_concern, char* tag);

	[CLink] public static extern int32_t mongoc_write_concern_get_wtimeout(mongoc_write_concern_t* write_concern);

	[CLink] public static extern int64_t mongoc_write_concern_get_wtimeout_int64(mongoc_write_concern_t* write_concern);

	[CLink] public static extern void mongoc_write_concern_set_wtimeout(mongoc_write_concern_t* write_concern, int32_t wtimeout_msec);

	[CLink] public static extern void mongoc_write_concern_set_wtimeout_int64(mongoc_write_concern_t* write_concern, int64_t wtimeout_msec);

	[CLink] public static extern bool mongoc_write_concern_get_wmajority(mongoc_write_concern_t* write_concern);

	[CLink] public static extern void mongoc_write_concern_set_wmajority(mongoc_write_concern_t* write_concern, int32_t wtimeout_msec);

	[CLink] public static extern bool mongoc_write_concern_is_acknowledged(mongoc_write_concern_t* write_concern);

	[CLink] public static extern bool mongoc_write_concern_is_valid(mongoc_write_concern_t* write_concern);

	[CLink] public static extern bool mongoc_write_concern_append(mongoc_write_concern_t* write_concern, bson_t* doc);

	[CLink] public static extern bool mongoc_write_concern_is_default(mongoc_write_concern_t* write_concern);
}
