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
	public struct mongoc_matcher_t;

	[CLink] public static extern mongoc_matcher_t* mongoc_matcher_new(bson_t* query, bson_error_t* error); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED;

	[CLink] public static extern bool mongoc_matcher_match(mongoc_matcher_t* matcher, bson_t* document); // BSON_GNUC_DEPRECATED;

	[CLink] public static extern void mongoc_matcher_destroy(mongoc_matcher_t* matcher); // BSON_GNUC_DEPRECATED;
}