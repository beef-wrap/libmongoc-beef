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
	[CLink] public static extern int mongoc_get_major_version();

	[CLink] public static extern int mongoc_get_minor_version();

	[CLink] public static extern int mongoc_get_micro_version();

	[CLink] public static extern char*  mongoc_get_version();

	[CLink] public static extern bool mongoc_check_version(int required_major, int required_minor, int required_micro);
}