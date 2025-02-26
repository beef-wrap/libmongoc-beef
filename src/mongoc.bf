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

namespace libmongocBeef;

public static class libmongoc
{
	typealias size_t = c_uintptr;
	typealias ssize_t = size_t;
	typealias char = c_char;
	typealias unsigned = c_uint;

	typealias int8_t = c_char;
	typealias int16_t = c_short;
	typealias int32_t = c_int;
	typealias int64_t = int64;

	typealias uint8_t = c_uchar;
	typealias uint16_t = c_ushort;
	typealias uint32_t = c_uint;
	typealias uint64_t = uint64;

	// from CRT
	typealias time_t = c_longlong;

	// from Winsock
	public struct timeval
	{
		c_long tv_sec; /* seconds */
		c_long tv_usec; /* and microseconds */
	};
}