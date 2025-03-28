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
	/**
	* mongoc_stream_tls_t:
	*
	* Overloaded mongoc_stream_t with additional TLS handshake and verification
	* callbacks.
	*
	*/
	[CRepr]
	public struct _mongoc_stream_tls_t
	{
		mongoc_stream_t parent; /* The TLS stream wrapper */
		mongoc_stream_t* base_stream; /* The underlying actual stream */
		void* ctx; /* TLS lib specific configuration or wrappers */
		int64_t timeout_msec;
		mongoc_ssl_opt_t ssl_opts;
		function bool handshake(mongoc_stream_t* stream, char* host, int* events /* OUT*/, bson_error_t* error);
	}

#if MONGOC_ENABLE_SSL_OPENSSL && OPENSSL_VERSION_NUMBER >= 0x10100000L
	[CLink] public static extern (mongoc_stream_t *) mongoc_stream_tls_new_with_hostname_and_openssl_context (mongoc_stream_t *base_stream, char* host, mongoc_ssl_opt_t *opt, int client, SSL_CTX *ssl_ctx) BSON_GNUC_WARN_UNUSED_RESULT;
#endif
}