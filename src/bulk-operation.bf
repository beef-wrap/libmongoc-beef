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

/* ordered, bypass_document_validation, has_collation, multi */
// #define MONGOC_BULK_WRITE_FLAGS_INIT \
//    {                                 \
//       true, false, 0                 \
//    }

using System;
using System.Interop;

namespace libmongocBeef;

using static libbsonBeef.libbson;

extension libmongoc
{
	/* forward decl */
	public struct _mongoc_client_session_t;

	public struct mongoc_bulk_operation_t;
	public struct mongoc_bulk_write_flags_t;

	[CLink] public static extern void mongoc_bulk_operation_destroy(mongoc_bulk_operation_t* bulk);

	[CLink] public static extern uint32_t mongoc_bulk_operation_execute(mongoc_bulk_operation_t* bulk, bson_t* reply, bson_error_t* error);

	[CLink] public static extern void mongoc_bulk_operation_delete(mongoc_bulk_operation_t* bulk, bson_t* selector); // BSON_GNUC_DEPRECATED_FOR (mongoc_bulk_operation_remove);

	[CLink] public static extern void mongoc_bulk_operation_delete_one(mongoc_bulk_operation_t* bulk, bson_t* selector); // BSON_GNUC_DEPRECATED_FOR (mongoc_bulk_operation_remove_one);

	[CLink] public static extern void mongoc_bulk_operation_insert(mongoc_bulk_operation_t* bulk, bson_t* document);

	[CLink] public static extern bool mongoc_bulk_operation_insert_with_opts(mongoc_bulk_operation_t* bulk, bson_t* document, bson_t* opts, bson_error_t* error); /* OUT */

	[CLink] public static extern void mongoc_bulk_operation_remove(mongoc_bulk_operation_t* bulk, bson_t* selector);

	[CLink] public static extern bool mongoc_bulk_operation_remove_many_with_opts(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* opts, bson_error_t* error); /* OUT */

	[CLink] public static extern void mongoc_bulk_operation_remove_one(mongoc_bulk_operation_t* bulk, bson_t* selector);

	[CLink] public static extern bool mongoc_bulk_operation_remove_one_with_opts(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* opts, bson_error_t* error); /* OUT */

	[CLink] public static extern void mongoc_bulk_operation_replace_one(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* document, bool upsert);

	[CLink] public static extern bool mongoc_bulk_operation_replace_one_with_opts(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* document, bson_t* opts, bson_error_t* error); /* OUT */

	[CLink] public static extern void mongoc_bulk_operation_update(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* document, bool upsert);

	[CLink] public static extern bool mongoc_bulk_operation_update_many_with_opts(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* document, bson_t* opts, bson_error_t* error); /* OUT */

	[CLink] public static extern void mongoc_bulk_operation_update_one(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* document, bool upsert);

	[CLink] public static extern bool mongoc_bulk_operation_update_one_with_opts(mongoc_bulk_operation_t* bulk, bson_t* selector, bson_t* document, bson_t* opts, bson_error_t* error); /* OUT */

	[CLink] public static extern void mongoc_bulk_operation_set_bypass_document_validation(mongoc_bulk_operation_t* bulk, bool bypass);

	[CLink] public static extern void mongoc_bulk_operation_set_comment(mongoc_bulk_operation_t* bulk, bson_value_t* comment);

	[CLink] public static extern void mongoc_bulk_operation_set_let(mongoc_bulk_operation_t* bulk, bson_t* let_);


	/*
	*  The following functions are really only useful by language bindings and
	*  those wanting to replay a bulk operation to a number of clients or
	*  collections.
	*/

	[CLink] public static extern mongoc_bulk_operation_t* mongoc_bulk_operation_new(bool ordered); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_bulk_operation_set_write_concern(mongoc_bulk_operation_t* bulk, mongoc_write_concern_t* write_concern);

	[CLink] public static extern void mongoc_bulk_operation_set_database(mongoc_bulk_operation_t* bulk, char* database);

	[CLink] public static extern void mongoc_bulk_operation_set_collection(mongoc_bulk_operation_t* bulk, char* collection);

	[CLink] public static extern void mongoc_bulk_operation_set_client(mongoc_bulk_operation_t* bulk, void* client);

	[CLink] public static extern void mongoc_bulk_operation_set_client_session(mongoc_bulk_operation_t* bulk,  _mongoc_client_session_t* client_session);

	[CLink] public static extern void mongoc_bulk_operation_set_server_id(mongoc_bulk_operation_t* bulk, uint32_t server_id);

	[CLink] public static extern uint32_t mongoc_bulk_operation_get_server_id(mongoc_bulk_operation_t* bulk);

	// `mongoc_bulk_operation_set_hint` is deprecated for the more aptly named `mongoc_bulk_operation_set_server_id`.
	[CLink] public static extern void mongoc_bulk_operation_set_hint(mongoc_bulk_operation_t* bulk, uint32_t server_id); // BSON_GNUC_DEPRECATED_FOR (mongoc_bulk_operation_set_server_id);
	
	// `mongoc_bulk_operation_get_hint` is deprecated for the more aptly named `mongoc_bulk_operation_get_server_id`.
	[CLink] public static extern uint32_t mongoc_bulk_operation_get_hint(mongoc_bulk_operation_t* bulk); // BSON_GNUC_DEPRECATED_FOR (mongoc_bulk_operation_get_server_id);

	[CLink] public static extern mongoc_write_concern_t* mongoc_bulk_operation_get_write_concern(mongoc_bulk_operation_t* bulk);

}