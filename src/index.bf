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
	[CRepr]
	public struct mongoc_index_opt_geo_t
	{
		uint8_t twod_sphere_version;
		uint8_t twod_bits_precision;
		double twod_location_min;
		double twod_location_max;
		double haystack_bucket_size;
		uint8_t[32]* padding;
	}

	[CRepr]
	public struct mongoc_index_opt_storage_t
	{
		int type;
	}

	public enum mongoc_index_storage_opt_type_t
	{
		MONGOC_INDEX_STORAGE_OPT_MMAPV1,
		MONGOC_INDEX_STORAGE_OPT_WIREDTIGER,
	}

	[CRepr]
	public struct mongoc_index_opt_wt_t
	{
		mongoc_index_opt_storage_t base_;
		char* config_str;
		void[8]* padding;
	}

	[CRepr]
	public struct mongoc_index_opt_t
	{
		bool is_initialized;
		bool background;
		bool unique;
		char* name;
		bool drop_dups;
		bool sparse;
		int32_t expire_after_seconds;
		int32_t v;
		bson_t* weights;
		char* default_language;
		char* language_override;
		mongoc_index_opt_geo_t* geo_options;
		mongoc_index_opt_storage_t* storage_options;
		bson_t* partial_filter_expression;
		bson_t* collation;
		void[4]* padding;
	}

	[CLink] public static extern mongoc_index_opt_t*  mongoc_index_opt_get_default(void); // BSON_GNUC_PURE;

	[CLink] public static extern mongoc_index_opt_geo_t*  mongoc_index_opt_geo_get_default(void); // BSON_GNUC_PURE;

	[CLink] public static extern mongoc_index_opt_wt_t*  mongoc_index_opt_wt_get_default(void); // BSON_GNUC_PURE;

	[CLink] public static extern void mongoc_index_opt_init(mongoc_index_opt_t* opt);

	[CLink] public static extern void mongoc_index_opt_geo_init(mongoc_index_opt_geo_t* opt);

	[CLink] public static extern void mongoc_index_opt_wt_init(mongoc_index_opt_wt_t* opt);
}