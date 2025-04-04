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
	public struct mongoc_socket_t;

	public struct mongoc_stream_socket_t;

	[CLink] public static extern mongoc_stream_t* mongoc_stream_socket_new(mongoc_socket_t* socket); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_socket_t* mongoc_stream_socket_get_socket(mongoc_stream_socket_t* stream);
}