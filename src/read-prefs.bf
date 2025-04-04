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
	public struct mongoc_read_prefs_t;

	public enum mongoc_read_mode_t : c_int
	{
	   /** Represents $readPreference.mode of 'primary' */
		MONGOC_READ_PRIMARY = (1 << 0),
	   /** Represents $readPreference.mode of 'secondary' */
		MONGOC_READ_SECONDARY = (1 << 1),
	   /** Represents $readPreference.mode of 'primaryPreferred' */
		MONGOC_READ_PRIMARY_PREFERRED = (1 << 2) | MONGOC_READ_PRIMARY,
	   /** Represents $readPreference.mode of 'secondaryPreferred' */
		MONGOC_READ_SECONDARY_PREFERRED = (1 << 2) | MONGOC_READ_SECONDARY,
	   /** Represents $readPreference.mode of 'nearest' */
		MONGOC_READ_NEAREST = (1 << 3) | MONGOC_READ_SECONDARY,
	}

	[CLink] public static extern mongoc_read_prefs_t* mongoc_read_prefs_new(mongoc_read_mode_t read_mode); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_read_prefs_t* mongoc_read_prefs_copy(mongoc_read_prefs_t* read_prefs); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_read_prefs_destroy(mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern mongoc_read_mode_t mongoc_read_prefs_get_mode(mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern void mongoc_read_prefs_set_mode(mongoc_read_prefs_t* read_prefs, mongoc_read_mode_t mode);

	[CLink] public static extern bson_t* mongoc_read_prefs_get_tags(mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern void mongoc_read_prefs_set_tags(mongoc_read_prefs_t* read_prefs, bson_t* tags);

	[CLink] public static extern void mongoc_read_prefs_add_tag(mongoc_read_prefs_t* read_prefs, bson_t* tag);

	[CLink] public static extern int64_t mongoc_read_prefs_get_max_staleness_seconds(mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern void mongoc_read_prefs_set_max_staleness_seconds(mongoc_read_prefs_t* read_prefs, int64_t max_staleness_seconds);

	[CLink] public static extern bson_t* mongoc_read_prefs_get_hedge(mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern void mongoc_read_prefs_set_hedge(mongoc_read_prefs_t* read_prefs, bson_t* hedge);

	[CLink] public static extern bool mongoc_read_prefs_is_valid(mongoc_read_prefs_t* read_prefs);
}