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
   /*
   * Application Performance Management (APM) interface, complies with two specs.
   * MongoDB's Command Logging and Monitoring Spec:
   *
   * https://github.com/mongodb/specifications/tree/master/source/command-logging-and-monitoring
   *
   * MongoDB's Spec for Monitoring Server Discovery and Monitoring (SDAM) events:
   *
   * https://github.com/mongodb/specifications/tree/master/source/server-discovery-and-monitoring
   *
   */

   /*
   * callbacks to receive APM events
   */
	public struct mongoc_apm_callbacks_t;


   /*
   * command monitoring events
   */

	public struct mongoc_apm_command_started_t;
	public struct mongoc_apm_command_succeeded_t;
	public struct mongoc_apm_command_failed_t;


   /*
   * SDAM monitoring events
   */

	public struct mongoc_apm_server_changed_t;
	public struct mongoc_apm_server_opening_t;
	public struct mongoc_apm_server_closed_t;
	public struct mongoc_apm_topology_changed_t;
	public struct mongoc_apm_topology_opening_t;
	public struct mongoc_apm_topology_closed_t;
	public struct mongoc_apm_server_heartbeat_started_t;
	public struct mongoc_apm_server_heartbeat_succeeded_t;
	public struct mongoc_apm_server_heartbeat_failed_t;

   /*
   * event field accessors
   */

   /* command-started event fields */

	[CLink] public static extern bson_t* mongoc_apm_command_started_get_command(mongoc_apm_command_started_t* event);

	[CLink] public static extern char*  mongoc_apm_command_started_get_database_name(mongoc_apm_command_started_t* event);

	[CLink] public static extern char*  mongoc_apm_command_started_get_command_name(mongoc_apm_command_started_t* event);

	[CLink] public static extern int64_t mongoc_apm_command_started_get_request_id(mongoc_apm_command_started_t* event);

	[CLink] public static extern int64_t mongoc_apm_command_started_get_operation_id(mongoc_apm_command_started_t* event);

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_command_started_get_host(mongoc_apm_command_started_t* event);

	[CLink] public static extern uint32_t mongoc_apm_command_started_get_server_id(mongoc_apm_command_started_t* event);

	[CLink] public static extern bson_oid_t* mongoc_apm_command_started_get_service_id(mongoc_apm_command_started_t* event);

	[CLink] public static extern int32_t mongoc_apm_command_started_get_server_connection_id(mongoc_apm_command_started_t* event); // BSON_GNUC_DEPRECATED_FOR ("mongoc_apm_command_started_get_server_connection_id_int64");

	[CLink] public static extern int64_t mongoc_apm_command_started_get_server_connection_id_int64(mongoc_apm_command_started_t* event);

	[CLink] public static extern void* mongoc_apm_command_started_get_context(mongoc_apm_command_started_t* event);


   /* command-succeeded event fields */

	[CLink] public static extern int64_t mongoc_apm_command_succeeded_get_duration(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern bson_t* mongoc_apm_command_succeeded_get_reply(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern char*  mongoc_apm_command_succeeded_get_command_name(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern char*  mongoc_apm_command_succeeded_get_database_name(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern int64_t mongoc_apm_command_succeeded_get_request_id(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern int64_t mongoc_apm_command_succeeded_get_operation_id(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_command_succeeded_get_host(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern uint32_t mongoc_apm_command_succeeded_get_server_id(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern bson_oid_t* mongoc_apm_command_succeeded_get_service_id(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern int32_t mongoc_apm_command_succeeded_get_server_connection_id(mongoc_apm_command_succeeded_t* event); // BSON_GNUC_DEPRECATED_FOR ("mongoc_apm_command_succeeded_get_server_connection_id_int64");

	[CLink] public static extern int64_t mongoc_apm_command_succeeded_get_server_connection_id_int64(mongoc_apm_command_succeeded_t* event);

	[CLink] public static extern void* mongoc_apm_command_succeeded_get_context(mongoc_apm_command_succeeded_t* event);


   /* command-failed event fields */

	[CLink] public static extern int64_t mongoc_apm_command_failed_get_duration(mongoc_apm_command_failed_t* event);

	[CLink] public static extern char*  mongoc_apm_command_failed_get_command_name(mongoc_apm_command_failed_t* event);

	[CLink] public static extern char*  mongoc_apm_command_failed_get_database_name(mongoc_apm_command_failed_t* event);

   /* retrieve the error by filling out the passed-in "error" struct */
	[CLink] public static extern void mongoc_apm_command_failed_get_error(mongoc_apm_command_failed_t* event, bson_error_t* error);

	[CLink] public static extern bson_t* mongoc_apm_command_failed_get_reply(mongoc_apm_command_failed_t* event);

	[CLink] public static extern int64_t mongoc_apm_command_failed_get_request_id(mongoc_apm_command_failed_t* event);

	[CLink] public static extern int64_t mongoc_apm_command_failed_get_operation_id(mongoc_apm_command_failed_t* event);

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_command_failed_get_host(mongoc_apm_command_failed_t* event);

	[CLink] public static extern uint32_t mongoc_apm_command_failed_get_server_id(mongoc_apm_command_failed_t* event);

	[CLink] public static extern bson_oid_t* mongoc_apm_command_failed_get_service_id(mongoc_apm_command_failed_t* event);

	[CLink] public static extern int32_t mongoc_apm_command_failed_get_server_connection_id(mongoc_apm_command_failed_t* event); // BSON_GNUC_DEPRECATED_FOR ("mongoc_apm_command_failed_get_server_connection_id_int64");

	[CLink] public static extern int64_t mongoc_apm_command_failed_get_server_connection_id_int64(mongoc_apm_command_failed_t* event);

	[CLink] public static extern void* mongoc_apm_command_failed_get_context(mongoc_apm_command_failed_t* event);


   /* server-changed event fields */

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_server_changed_get_host(mongoc_apm_server_changed_t* event);

	[CLink] public static extern void mongoc_apm_server_changed_get_topology_id(mongoc_apm_server_changed_t* event, bson_oid_t* topology_id);

	[CLink] public static extern mongoc_server_description_t* mongoc_apm_server_changed_get_previous_description(mongoc_apm_server_changed_t* event);

	[CLink] public static extern mongoc_server_description_t* mongoc_apm_server_changed_get_new_description(mongoc_apm_server_changed_t* event);

	[CLink] public static extern void* mongoc_apm_server_changed_get_context(mongoc_apm_server_changed_t* event);


   /* server-opening event fields */

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_server_opening_get_host(mongoc_apm_server_opening_t* event);

	[CLink] public static extern void mongoc_apm_server_opening_get_topology_id(mongoc_apm_server_opening_t* event, bson_oid_t* topology_id);

	[CLink] public static extern void* mongoc_apm_server_opening_get_context(mongoc_apm_server_opening_t* event);


   /* server-closed event fields */

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_server_closed_get_host(mongoc_apm_server_closed_t* event);

	[CLink] public static extern void mongoc_apm_server_closed_get_topology_id(mongoc_apm_server_closed_t* event, bson_oid_t* topology_id);

	[CLink] public static extern void* mongoc_apm_server_closed_get_context(mongoc_apm_server_closed_t* event);


   /* topology-changed event fields */

	[CLink] public static extern void mongoc_apm_topology_changed_get_topology_id(mongoc_apm_topology_changed_t* event, bson_oid_t* topology_id);

	[CLink] public static extern mongoc_topology_description_t* mongoc_apm_topology_changed_get_previous_description(mongoc_apm_topology_changed_t* event);

	[CLink] public static extern mongoc_topology_description_t* mongoc_apm_topology_changed_get_new_description(mongoc_apm_topology_changed_t* event);

	[CLink] public static extern void* mongoc_apm_topology_changed_get_context(mongoc_apm_topology_changed_t* event);


   /* topology-opening event field */

	[CLink] public static extern void mongoc_apm_topology_opening_get_topology_id(mongoc_apm_topology_opening_t* event, bson_oid_t* topology_id);

	[CLink] public static extern void* mongoc_apm_topology_opening_get_context(mongoc_apm_topology_opening_t* event);


   /* topology-closed event field */

	[CLink] public static extern void mongoc_apm_topology_closed_get_topology_id(mongoc_apm_topology_closed_t* event, bson_oid_t* topology_id);

	[CLink] public static extern void* mongoc_apm_topology_closed_get_context(mongoc_apm_topology_closed_t* event);


   /* heartbeat-started event field */

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_server_heartbeat_started_get_host(mongoc_apm_server_heartbeat_started_t* event);

	[CLink] public static extern void* mongoc_apm_server_heartbeat_started_get_context(mongoc_apm_server_heartbeat_started_t* event);

	[CLink] public static extern bool mongoc_apm_server_heartbeat_started_get_awaited(mongoc_apm_server_heartbeat_started_t* event);


   /* heartbeat-succeeded event fields */

	[CLink] public static extern int64_t mongoc_apm_server_heartbeat_succeeded_get_duration(mongoc_apm_server_heartbeat_succeeded_t* event);

	[CLink] public static extern bson_t* mongoc_apm_server_heartbeat_succeeded_get_reply(mongoc_apm_server_heartbeat_succeeded_t* event);

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_server_heartbeat_succeeded_get_host(mongoc_apm_server_heartbeat_succeeded_t* event);

	[CLink] public static extern void* mongoc_apm_server_heartbeat_succeeded_get_context(mongoc_apm_server_heartbeat_succeeded_t* event);

	[CLink] public static extern bool mongoc_apm_server_heartbeat_succeeded_get_awaited(mongoc_apm_server_heartbeat_succeeded_t* event);


   /* heartbeat-failed event fields */

	[CLink] public static extern int64_t mongoc_apm_server_heartbeat_failed_get_duration(mongoc_apm_server_heartbeat_failed_t* event);

	[CLink] public static extern void mongoc_apm_server_heartbeat_failed_get_error(mongoc_apm_server_heartbeat_failed_t* event, bson_error_t* error);

	[CLink] public static extern mongoc_host_list_t* mongoc_apm_server_heartbeat_failed_get_host(mongoc_apm_server_heartbeat_failed_t* event);

	[CLink] public static extern void* mongoc_apm_server_heartbeat_failed_get_context(mongoc_apm_server_heartbeat_failed_t* event);

	[CLink] public static extern bool mongoc_apm_server_heartbeat_failed_get_awaited(mongoc_apm_server_heartbeat_failed_t* event);



   /*
   * callbacks
   */

	function void mongoc_apm_command_started_cb_t(mongoc_apm_command_started_t* event);
	function void mongoc_apm_command_succeeded_cb_t(mongoc_apm_command_succeeded_t* event);
	function void mongoc_apm_command_failed_cb_t(mongoc_apm_command_failed_t* event);
	function void mongoc_apm_server_changed_cb_t(mongoc_apm_server_changed_t* event);
	function void mongoc_apm_server_opening_cb_t(mongoc_apm_server_opening_t* event);
	function void mongoc_apm_server_closed_cb_t(mongoc_apm_server_closed_t* event);
	function void mongoc_apm_topology_changed_cb_t(mongoc_apm_topology_changed_t* event);
	function void mongoc_apm_topology_opening_cb_t(mongoc_apm_topology_opening_t* event);
	function void mongoc_apm_topology_closed_cb_t(mongoc_apm_topology_closed_t* event);
	function void mongoc_apm_server_heartbeat_started_cb_t(mongoc_apm_server_heartbeat_started_t* event);
	function void mongoc_apm_server_heartbeat_succeeded_cb_t(mongoc_apm_server_heartbeat_succeeded_t* event);
	function void mongoc_apm_server_heartbeat_failed_cb_t(mongoc_apm_server_heartbeat_failed_t* event);

   /*
   * registering callbacks
   */

	[CLink] public static extern mongoc_apm_callbacks_t* mongoc_apm_callbacks_new(); // BSON_GNUC_WARN_UNUSED_RESULT;

	[CLink] public static extern void mongoc_apm_callbacks_destroy(mongoc_apm_callbacks_t* callbacks);

	[CLink] public static extern void mongoc_apm_set_command_started_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_command_started_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_command_succeeded_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_command_succeeded_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_command_failed_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_command_failed_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_server_changed_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_server_changed_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_server_opening_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_server_opening_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_server_closed_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_server_closed_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_topology_changed_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_topology_changed_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_topology_opening_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_topology_opening_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_topology_closed_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_topology_closed_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_server_heartbeat_started_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_server_heartbeat_started_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_server_heartbeat_succeeded_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_server_heartbeat_succeeded_cb_t cb);

	[CLink] public static extern void mongoc_apm_set_server_heartbeat_failed_cb(mongoc_apm_callbacks_t* callbacks, mongoc_apm_server_heartbeat_failed_cb_t cb);
}