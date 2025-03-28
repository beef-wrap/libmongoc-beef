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
	public struct mongoc_bulkwriteopts_t;

	[CLink] public static extern mongoc_bulkwriteopts_t*  mongoc_bulkwriteopts_new();

	[CLink] public static extern void mongoc_bulkwriteopts_set_ordered(mongoc_bulkwriteopts_t* self, bool ordered);

	[CLink] public static extern void mongoc_bulkwriteopts_set_bypassdocumentvalidation(mongoc_bulkwriteopts_t* self, bool bypassdocumentvalidation);

	[CLink] public static extern void mongoc_bulkwriteopts_set_let(mongoc_bulkwriteopts_t* self, bson_t* let_);

	[CLink] public static extern void mongoc_bulkwriteopts_set_writeconcern(mongoc_bulkwriteopts_t* self, mongoc_write_concern_t* writeconcern);

	[CLink] public static extern void mongoc_bulkwriteopts_set_comment(mongoc_bulkwriteopts_t* self, bson_value_t* comment);

	[CLink] public static extern void mongoc_bulkwriteopts_set_verboseresults(mongoc_bulkwriteopts_t* self, bool verboseresults);

	// `mongoc_bulkwriteopts_set_extra` appends `extra` to bulkWrite command.
	// It is intended to support future server options.
	[CLink] public static extern void mongoc_bulkwriteopts_set_extra(mongoc_bulkwriteopts_t* self, bson_t* extra);

	// `mongoc_bulkwriteopts_set_serverid` identifies which server to perform the operation. This is intended for use by
	// wrapping drivers that select a server before running the operation.
	[CLink] public static extern void mongoc_bulkwriteopts_set_serverid(mongoc_bulkwriteopts_t* self, uint32_t serverid);

	[CLink] public static extern void mongoc_bulkwriteopts_destroy(mongoc_bulkwriteopts_t* self);


	public struct mongoc_bulkwriteresult_t;

	[CLink] public static extern int64_t mongoc_bulkwriteresult_insertedcount(mongoc_bulkwriteresult_t* self);

	[CLink] public static extern int64_t mongoc_bulkwriteresult_upsertedcount(mongoc_bulkwriteresult_t* self);

	[CLink] public static extern int64_t mongoc_bulkwriteresult_matchedcount(mongoc_bulkwriteresult_t* self);

	[CLink] public static extern int64_t mongoc_bulkwriteresult_modifiedcount(mongoc_bulkwriteresult_t* self);

	[CLink] public static extern int64_t mongoc_bulkwriteresult_deletedcount(mongoc_bulkwriteresult_t* self);


	// `mongoc_bulkwriteresult_insertresults` returns a BSON document mapping model indexes to insert results.
	// Example:
	// {
	//   "0" : { "insertedId" : "foo" },
	//   "1" : { "insertedId" : "bar" }
	// }
	// Returns NULL if verbose results were not requested.
	[CLink] public static extern bson_t*  mongoc_bulkwriteresult_insertresults(mongoc_bulkwriteresult_t* self);


	// `mongoc_bulkwriteresult_updateresults` returns a BSON document mapping model indexes to update results.
	// Example:
	// {
	//   "0" : { "matchedCount" : 2, "modifiedCount" : 2 },
	//   "1" : { "matchedCount" : 1, "modifiedCount" : 0, "upsertedId" : "foo" }
	// }
	// Returns NULL if verbose results were not requested.
	[CLink] public static extern bson_t*  mongoc_bulkwriteresult_updateresults(mongoc_bulkwriteresult_t* self);


	// `mongoc_bulkwriteresult_deleteresults` returns a BSON document mapping model indexes to delete results.
	// Example:
	// {
	//   "0" : { "deletedCount" : 1 },
	//   "1" : { "deletedCount" : 2 }
	// }
	// Returns NULL if verbose results were not requested.
	[CLink] public static extern bson_t*  mongoc_bulkwriteresult_deleteresults(mongoc_bulkwriteresult_t* self);


	// `mongoc_bulkwriteresult_serverid` identifies the most recently selected server. This may differ from a
	// previously set serverid if a retry occurred. This is intended for use by wrapping drivers that select a server before
	// running the operation.
	[CLink] public static extern uint32_t mongoc_bulkwriteresult_serverid(mongoc_bulkwriteresult_t* self);

	[CLink] public static extern void mongoc_bulkwriteresult_destroy(mongoc_bulkwriteresult_t* self);


	public struct mongoc_bulkwriteexception_t;

	// Returns true if there was a top-level error.
	[CLink] public static extern bool mongoc_bulkwriteexception_error(mongoc_bulkwriteexception_t* self, bson_error_t* error);


	// `mongoc_bulkwriteexception_writeerrors` returns a BSON document mapping model indexes to write errors.
	// Example:
	// {
	//   "0" : { "code" : 123, "message" : "foo", "details" : {  } },
	//   "1" : { "code" : 456, "message" : "bar", "details" : {  } }
	// }
	// Returns an empty document if there are no write errors.
	[CLink] public static extern bson_t*  mongoc_bulkwriteexception_writeerrors(mongoc_bulkwriteexception_t* self);


	// `mongoc_bulkwriteexception_writeconcernerrors` returns a BSON array of write concern errors.
	// Example:
	// [
	//    { "code" : 123, "message" : "foo", "details" : {  } },
	//    { "code" : 456, "message" : "bar", "details" : {  } }
	// ]
	// Returns an empty array if there are no write concern errors.
	[CLink] public static extern bson_t*  mongoc_bulkwriteexception_writeconcernerrors(mongoc_bulkwriteexception_t* self);


	// `mongoc_bulkwriteexception_errorreply` returns a possible server reply related to the error, or an empty document.
	[CLink] public static extern bson_t*  mongoc_bulkwriteexception_errorreply(mongoc_bulkwriteexception_t* self);

	[CLink] public static extern void mongoc_bulkwriteexception_destroy(mongoc_bulkwriteexception_t* self);


	public struct mongoc_bulkwrite_t;

	[CLink] public static extern mongoc_bulkwrite_t*  mongoc_client_bulkwrite_new(mongoc_client_t* self);


	public struct mongoc_bulkwrite_insertoneopts_t;

	[CLink] public static extern mongoc_bulkwrite_insertoneopts_t*  mongoc_bulkwrite_insertoneopts_new();

	[CLink] public static extern void mongoc_bulkwrite_insertoneopts_destroy(mongoc_bulkwrite_insertoneopts_t* self);

	[CLink] public static extern bool mongoc_bulkwrite_append_insertone(mongoc_bulkwrite_t* self, char* ns, bson_t* document, mongoc_bulkwrite_insertoneopts_t* opts /* May be NULL */, bson_error_t* error);


	public struct mongoc_bulkwrite_updateoneopts_t;

	[CLink] public static extern mongoc_bulkwrite_updateoneopts_t*  mongoc_bulkwrite_updateoneopts_new();

	[CLink] public static extern void mongoc_bulkwrite_updateoneopts_set_arrayfilters(mongoc_bulkwrite_updateoneopts_t* self, bson_t* arrayfilters);

	[CLink] public static extern void mongoc_bulkwrite_updateoneopts_set_collation(mongoc_bulkwrite_updateoneopts_t* self, bson_t* collation);

	[CLink] public static extern void mongoc_bulkwrite_updateoneopts_set_hint(mongoc_bulkwrite_updateoneopts_t* self, bson_value_t* hint);

	[CLink] public static extern void mongoc_bulkwrite_updateoneopts_set_upsert(mongoc_bulkwrite_updateoneopts_t* self, bool upsert);

	[CLink] public static extern void mongoc_bulkwrite_updateoneopts_set_sort(mongoc_bulkwrite_updateoneopts_t* self, bson_t* sort);

	[CLink] public static extern void mongoc_bulkwrite_updateoneopts_destroy(mongoc_bulkwrite_updateoneopts_t* self);

	[CLink] public static extern bool mongoc_bulkwrite_append_updateone(mongoc_bulkwrite_t* self, char* ns, bson_t* filter, bson_t* update, mongoc_bulkwrite_updateoneopts_t* opts /* May be NULL */, bson_error_t* error);


	public struct mongoc_bulkwrite_updatemanyopts_t;

	[CLink] public static extern mongoc_bulkwrite_updatemanyopts_t*  mongoc_bulkwrite_updatemanyopts_new();

	[CLink] public static extern void mongoc_bulkwrite_updatemanyopts_set_arrayfilters(mongoc_bulkwrite_updatemanyopts_t* self, bson_t* arrayfilters);

	[CLink] public static extern void mongoc_bulkwrite_updatemanyopts_set_collation(mongoc_bulkwrite_updatemanyopts_t* self, bson_t* collation);

	[CLink] public static extern void mongoc_bulkwrite_updatemanyopts_set_hint(mongoc_bulkwrite_updatemanyopts_t* self, bson_value_t* hint);

	[CLink] public static extern void mongoc_bulkwrite_updatemanyopts_set_upsert(mongoc_bulkwrite_updatemanyopts_t* self, bool upsert);

	[CLink] public static extern void mongoc_bulkwrite_updatemanyopts_destroy(mongoc_bulkwrite_updatemanyopts_t* self);

	[CLink] public static extern bool mongoc_bulkwrite_append_updatemany(mongoc_bulkwrite_t* self, char* ns, bson_t* filter, bson_t* update, mongoc_bulkwrite_updatemanyopts_t* opts /* May be NULL */, bson_error_t* error);


	public struct mongoc_bulkwrite_replaceoneopts_t;

	[CLink] public static extern mongoc_bulkwrite_replaceoneopts_t*  mongoc_bulkwrite_replaceoneopts_new();

	[CLink] public static extern void mongoc_bulkwrite_replaceoneopts_set_collation(mongoc_bulkwrite_replaceoneopts_t* self, bson_t* collation);

	[CLink] public static extern void mongoc_bulkwrite_replaceoneopts_set_hint(mongoc_bulkwrite_replaceoneopts_t* self, bson_value_t* hint);

	[CLink] public static extern void mongoc_bulkwrite_replaceoneopts_set_upsert(mongoc_bulkwrite_replaceoneopts_t* self, bool upsert);

	[CLink] public static extern void mongoc_bulkwrite_replaceoneopts_set_sort(mongoc_bulkwrite_replaceoneopts_t* self, bson_t* sort);

	[CLink] public static extern void mongoc_bulkwrite_replaceoneopts_destroy(mongoc_bulkwrite_replaceoneopts_t* self);

	[CLink] public static extern bool mongoc_bulkwrite_append_replaceone(mongoc_bulkwrite_t* self, char* ns, bson_t* filter, bson_t* replacement, mongoc_bulkwrite_replaceoneopts_t* opts /* May be NULL */, bson_error_t* error);


	public struct mongoc_bulkwrite_deleteoneopts_t;

	[CLink] public static extern mongoc_bulkwrite_deleteoneopts_t*  mongoc_bulkwrite_deleteoneopts_new();

	[CLink] public static extern void mongoc_bulkwrite_deleteoneopts_set_collation(mongoc_bulkwrite_deleteoneopts_t* self, bson_t* collation);

	[CLink] public static extern void mongoc_bulkwrite_deleteoneopts_set_hint(mongoc_bulkwrite_deleteoneopts_t* self, bson_value_t* hint);

	[CLink] public static extern void mongoc_bulkwrite_deleteoneopts_destroy(mongoc_bulkwrite_deleteoneopts_t* self);

	[CLink] public static extern bool mongoc_bulkwrite_append_deleteone(mongoc_bulkwrite_t* self, char* ns, bson_t* filter, mongoc_bulkwrite_deleteoneopts_t* opts /* May be NULL */, bson_error_t* error);


	public struct mongoc_bulkwrite_deletemanyopts_t;

	[CLink] public static extern mongoc_bulkwrite_deletemanyopts_t*  mongoc_bulkwrite_deletemanyopts_new();

	[CLink] public static extern void mongoc_bulkwrite_deletemanyopts_set_collation(mongoc_bulkwrite_deletemanyopts_t* self, bson_t* collation);

	[CLink] public static extern void mongoc_bulkwrite_deletemanyopts_set_hint(mongoc_bulkwrite_deletemanyopts_t* self, bson_value_t* hint);

	[CLink] public static extern void mongoc_bulkwrite_deletemanyopts_destroy(mongoc_bulkwrite_deletemanyopts_t* self);

	[CLink] public static extern bool mongoc_bulkwrite_append_deletemany(mongoc_bulkwrite_t* self, char* ns, bson_t* filter, mongoc_bulkwrite_deletemanyopts_t* opts /* May be NULL */, bson_error_t* error);


	// `mongoc_bulkwritereturn_t` may outlive `mongoc_bulkwrite_t`.
	public struct mongoc_bulkwritereturn_t
	{
		mongoc_bulkwriteresult_t* res; // NULL if no known successful writes or write was unacknowledged.
		mongoc_bulkwriteexception_t* exc; // NULL if no error.
	}

	// `mongoc_bulkwrite_new` and `mongoc_bulkwrite_set_client` may be used by
	// language bindings that want to assemble a `mongoc_bulkwrite_t` and defer
	// `mongoc_client_t` assignment to execution time.
	[CLink] public static extern mongoc_bulkwrite_t*  mongoc_bulkwrite_new();

	[CLink] public static extern void mongoc_bulkwrite_set_client(mongoc_bulkwrite_t* self, mongoc_client_t* client);

	// `mongoc_bulkwrite_set_session` sets an optional explicit session.
	// `*session` may be modified when `mongoc_bulkwrite_execute` is called.
	[CLink] public static extern void mongoc_bulkwrite_set_session(mongoc_bulkwrite_t* self, mongoc_client_session_t* session);

	// `mongoc_bulkwrite_execute` executes a bulk write operation.
	[CLink] public static extern mongoc_bulkwritereturn_t mongoc_bulkwrite_execute(mongoc_bulkwrite_t* self, mongoc_bulkwriteopts_t* opts);

	[CLink] public static extern void mongoc_bulkwrite_destroy(mongoc_bulkwrite_t* self);
}