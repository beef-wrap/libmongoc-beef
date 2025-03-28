using System;
using System.Diagnostics;
using static libbson.libbson;
using static libmongoc.libmongoc;

namespace example;

class Program
{
	public static int Main(String[] args)
	{
		mongoc_client_t* client;
		mongoc_collection_t* collection;
		mongoc_cursor_t* cursor;
		bson_error_t error = ?;
		bson_t* doc = ?;
		bson_t query;
		char8* str;
		char8* uri_string = "mongodb://127.0.0.1/?appname=client-example";
		mongoc_uri_t* uri;

		mongoc_init();

		uri = mongoc_uri_new_with_error(uri_string, &error);

		if (uri == null)
		{
			Debug.WriteLine($"failed to parse URI: {StringView(uri_string)}");
			Debug.WriteLine($"error message:       {StringView(&error.message)}");
			return 1;
		}

		client = mongoc_client_new_from_uri(uri);

		if (client == null)
		{
			return 1;
		}

		mongoc_client_set_error_api(client, 2);

		bson_init(&query);
		collection = mongoc_client_get_collection(client, "test", "test");

		cursor = mongoc_collection_find_with_opts(collection,
			&query,
			null, /* additional options */
			null); /* read prefs, null for default */

		while (mongoc_cursor_next(cursor, &doc))
		{
			str = bson_as_canonical_extended_json(doc, null);
			Debug.WriteLine(StringView(str));
			bson_free(str);
		}

		if (mongoc_cursor_error(cursor, &error))
		{
			Debug.WriteLine($"Cursor Failure: {error.message}");
			return 1;
		}

		bson_destroy(&query);
		mongoc_cursor_destroy(cursor);
		mongoc_collection_destroy(collection);
		mongoc_uri_destroy(uri);
		mongoc_client_destroy(client);
		mongoc_cleanup();

		return 0;
	}
}