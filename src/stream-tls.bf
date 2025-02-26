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
	public struct mongoc_stream_tls_t;

	public struct mongoc_ssl_opt_t {};

	[CLink] public static extern bool mongoc_stream_tls_handshake(mongoc_stream_t* stream, char* host, int32_t timeout_msec, int* events, bson_error_t* error);

	[CLink] public static extern bool mongoc_stream_tls_handshake_block(mongoc_stream_t* stream, char* host, int32_t timeout_msec, bson_error_t* error);

	[CLink] public static extern bool mongoc_stream_tls_do_handshake(mongoc_stream_t* stream, int32_t timeout_msec); // BSON_GNUC_DEPRECATED_FOR (mongoc_stream_tls_handshake);

	[CLink] public static extern bool mongoc_stream_tls_check_cert(mongoc_stream_t* stream, char* host); // BSON_GNUC_DEPRECATED_FOR (mongoc_stream_tls_handshake);

	[CLink] public static extern mongoc_stream_t* mongoc_stream_tls_new_with_hostname(mongoc_stream_t* base_stream, char* host, mongoc_ssl_opt_t* opt, int client); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_stream_t* mongoc_stream_tls_new(mongoc_stream_t* base_stream, mongoc_ssl_opt_t* opt, int client); // BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR (mongoc_stream_tls_new_with_hostname);
}