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

namespace libmongocBeef;

extension libmongoc
{
	typealias mongoc_socklen_t = int;

	public struct mongoc_stream_t { };

	[CRepr]
	public struct mongoc_stream_poll_t
	{
		mongoc_stream_t* stream;
		int events;
		int revents;
	}

	[CRepr]
	public struct _mongoc_stream_t
	{
		int type;
		function void destroy(mongoc_stream_t* stream);
		function int close(mongoc_stream_t* stream);
		function int flush(mongoc_stream_t* stream);
		function ssize_t writev(mongoc_stream_t* stream, mongoc_iovec_t* iov, size_t iovcnt, int32_t timeout_msec);
		function ssize_t readv(mongoc_stream_t* stream, mongoc_iovec_t* iov, size_t iovcnt, size_t min_bytes, int32_t timeout_msec);
		function int setsockopt(mongoc_stream_t* stream, int level, int optname, void* optval, mongoc_socklen_t optlen);
		function mongoc_stream_t* get_base_stream(mongoc_stream_t* stream);
		function bool check_closed(mongoc_stream_t* stream);
		function ssize_t poll(mongoc_stream_poll_t* streams, size_t nstreams, int32_t timeout);
		function void failed(mongoc_stream_t* stream);
		function bool timed_out(mongoc_stream_t* stream);
		function bool should_retry(mongoc_stream_t* stream);
		void[3]* padding;
	}

	[CLink] public static extern mongoc_stream_t*  mongoc_stream_get_base_stream(mongoc_stream_t* stream);

	[CLink] public static extern mongoc_stream_t*  mongoc_stream_get_tls_stream(mongoc_stream_t* stream);

	[CLink] public static extern int mongoc_stream_close(mongoc_stream_t* stream);

	[CLink] public static extern void mongoc_stream_destroy(mongoc_stream_t* stream);

	[CLink] public static extern void mongoc_stream_failed(mongoc_stream_t* stream);

	[CLink] public static extern int mongoc_stream_flush(mongoc_stream_t* stream);

	[CLink] public static extern ssize_t mongoc_stream_writev(mongoc_stream_t* stream, mongoc_iovec_t* iov, size_t iovcnt, int32_t timeout_msec);

	[CLink] public static extern ssize_t mongoc_stream_write(mongoc_stream_t* stream, void* buf, size_t count, int32_t timeout_msec);

	[CLink] public static extern ssize_t mongoc_stream_readv(mongoc_stream_t* stream, mongoc_iovec_t* iov, size_t iovcnt, size_t min_bytes, int32_t timeout_msec);

	[CLink] public static extern ssize_t mongoc_stream_read(mongoc_stream_t* stream, void* buf, size_t count, size_t min_bytes, int32_t timeout_msec);

	[CLink] public static extern int mongoc_stream_setsockopt(mongoc_stream_t* stream, int level, int optname, void* optval, mongoc_socklen_t optlen);

	[CLink] public static extern bool mongoc_stream_check_closed(mongoc_stream_t* stream);

	[CLink] public static extern bool mongoc_stream_timed_out(mongoc_stream_t* stream);

	[CLink] public static extern bool mongoc_stream_should_retry(mongoc_stream_t* stream);

	[CLink] public static extern ssize_t mongoc_stream_poll(mongoc_stream_poll_t* streams, size_t nstreams, int32_t timeout);
}