/*
 * Copyright 2009-present MongoDB, Inc.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

using System;
using System.Interop;
using static libbson.libbson;

namespace libmongoc;

extension libmongoc
{
	public function bool mongoc_client_session_with_transaction_cb_t(mongoc_client_session_t* session, void* ctx, bson_t** reply, bson_error_t* error);

	public enum mongoc_transaction_state_t : c_int
	{
		MONGOC_TRANSACTION_NONE = 0,
		MONGOC_TRANSACTION_STARTING = 1,
		MONGOC_TRANSACTION_IN_PROGRESS = 2,
		MONGOC_TRANSACTION_COMMITTED = 3,
		MONGOC_TRANSACTION_ABORTED = 4,
	}

	 /* these options types are named "opt_t" but their functions are named with
	  * "opts", for consistency with the older mongoc_ssl_opt_t */
	[CLink] public static extern mongoc_transaction_opt_t* mongoc_transaction_opts_new(); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_transaction_opt_t* mongoc_transaction_opts_clone(mongoc_transaction_opt_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_transaction_opts_destroy(mongoc_transaction_opt_t* opts);

	[CLink] public static extern void mongoc_transaction_opts_set_max_commit_time_ms(mongoc_transaction_opt_t* opts, int64_t max_commit_time_ms);

	[CLink] public static extern int64_t mongoc_transaction_opts_get_max_commit_time_ms(mongoc_transaction_opt_t* opts);

	[CLink] public static extern void mongoc_transaction_opts_set_read_concern(mongoc_transaction_opt_t* opts, mongoc_read_concern_t* read_concern);

	[CLink] public static extern mongoc_read_concern_t* mongoc_transaction_opts_get_read_concern(mongoc_transaction_opt_t* opts);

	[CLink] public static extern void mongoc_transaction_opts_set_write_concern(mongoc_transaction_opt_t* opts, mongoc_write_concern_t* write_concern);

	[CLink] public static extern mongoc_write_concern_t* mongoc_transaction_opts_get_write_concern(mongoc_transaction_opt_t* opts);

	[CLink] public static extern void mongoc_transaction_opts_set_read_prefs(mongoc_transaction_opt_t* opts, mongoc_read_prefs_t* read_prefs);

	[CLink] public static extern mongoc_read_prefs_t* mongoc_transaction_opts_get_read_prefs(mongoc_transaction_opt_t* opts);

	[CLink] public static extern mongoc_session_opt_t* mongoc_session_opts_new(); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_session_opts_set_causal_consistency(mongoc_session_opt_t* opts, bool causal_consistency);

	[CLink] public static extern bool mongoc_session_opts_get_causal_consistency(mongoc_session_opt_t* opts);

	[CLink] public static extern void mongoc_session_opts_set_snapshot(mongoc_session_opt_t* opts, bool snapshot);

	[CLink] public static extern bool mongoc_session_opts_get_snapshot(mongoc_session_opt_t* opts);

	[CLink] public static extern void mongoc_session_opts_set_default_transaction_opts(mongoc_session_opt_t* opts, mongoc_transaction_opt_t* txn_opts);

	[CLink] public static extern mongoc_transaction_opt_t* mongoc_session_opts_get_default_transaction_opts(mongoc_session_opt_t* opts);

	[CLink] public static extern mongoc_transaction_opt_t* mongoc_session_opts_get_transaction_opts(mongoc_client_session_t* session); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern mongoc_session_opt_t* mongoc_session_opts_clone(mongoc_session_opt_t* opts); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_session_opts_destroy(mongoc_session_opt_t* opts);

	[CLink] public static extern mongoc_client_t* mongoc_client_session_get_client(mongoc_client_session_t* session);

	[CLink] public static extern mongoc_session_opt_t* mongoc_client_session_get_opts(mongoc_client_session_t* session);

	[CLink] public static extern bson_t* mongoc_client_session_get_lsid(mongoc_client_session_t* session);

	[CLink] public static extern bson_t* mongoc_client_session_get_cluster_time(mongoc_client_session_t* session);

	[CLink] public static extern void mongoc_client_session_advance_cluster_time(mongoc_client_session_t* session, bson_t* cluster_time);

	[CLink] public static extern void mongoc_client_session_get_operation_time(mongoc_client_session_t* session, uint32_t* timestamp, uint32_t* increment);

	[CLink] public static extern uint32_t mongoc_client_session_get_server_id(mongoc_client_session_t* session);

	[CLink] public static extern void mongoc_client_session_advance_operation_time(mongoc_client_session_t* session, uint32_t timestamp, uint32_t increment);

	[CLink] public static extern bool mongoc_client_session_with_transaction(mongoc_client_session_t* session, mongoc_client_session_with_transaction_cb_t cb, mongoc_transaction_opt_t* opts, void* ctx, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_session_start_transaction(mongoc_client_session_t* session, mongoc_transaction_opt_t* opts, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_session_in_transaction(mongoc_client_session_t* session);

	[CLink] public static extern mongoc_transaction_state_t mongoc_client_session_get_transaction_state(mongoc_client_session_t* session);

	[CLink] public static extern bool mongoc_client_session_commit_transaction(mongoc_client_session_t* session, bson_t* reply, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_session_abort_transaction(mongoc_client_session_t* session, bson_error_t* error);

	[CLink] public static extern bool mongoc_client_session_append(mongoc_client_session_t* client_session, bson_t* opts, bson_error_t* error);

	 /* There is no mongoc_client_session_end, only mongoc_client_session_destroy.
	 * Driver Sessions Spec: "In languages that have idiomatic ways of disposing of
	 * resources, drivers SHOULD support that in addition to or instead of
	 * endSession."
	 */

	[CLink] public static extern void mongoc_client_session_destroy(mongoc_client_session_t* session);

	[CLink] public static extern bool mongoc_client_session_get_dirty(mongoc_client_session_t* session);
}