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
 
extension libmongoc
{
   public struct mongoc_optional_t {
      bool value;
      bool is_set;
   }

   [CLink] public static extern void mongoc_optional_init (mongoc_optional_t *opt);

   [CLink] public static extern bool mongoc_optional_is_set (mongoc_optional_t *opt);

   [CLink] public static extern bool mongoc_optional_value (mongoc_optional_t *opt);

   [CLink] public static extern void mongoc_optional_set_value (mongoc_optional_t *opt, bool val);

   [CLink] public static extern void mongoc_optional_copy (mongoc_optional_t *source, mongoc_optional_t *copy);
}