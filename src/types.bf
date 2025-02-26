using System;
using System.Interop;

namespace libbsonBeef;

extension libbson
{


	/*
	*--------------------------------------------------------------------------
	*
	* bson_unichar_t --
	*
	*       bson_unichar_t provides an unsigned 32-bit type for containing
	*       unicode characters. When iterating UTF-8 sequences, this should
	*       be used to avoid losing the high-bits of non-ascii characters.
	*
	* See also:
	*       bson_string_append_unichar()
	*
	*--------------------------------------------------------------------------
	*/

	typealias bson_unichar_t = uint32_t;


	/**
	* @brief Flags configuring the creation of a bson_context_t
	*/
	enum bson_context_flags_t
	{
	/** Use default options */
		BSON_CONTEXT_NONE = 0,
	/* Deprecated: Generating new OIDs from a bson_context_t is always
		thread-safe */
		BSON_CONTEXT_THREAD_SAFE = (1 << 0),
	/* Deprecated: Does nothing and is ignored */
		BSON_CONTEXT_DISABLE_HOST_CACHE = (1 << 1),
	/* Call getpid() instead of remembering the result of getpid() when using the
		context */
		BSON_CONTEXT_DISABLE_PID_CACHE = (1 << 2),
	/* Deprecated: Does nothing */
		BSON_CONTEXT_USE_TASK_ID = (1 << 3),
	}


	/**
	* bson_context_t:
	*
	* This structure manages context for the bson library. It handles
	* configuration for thread-safety and other performance related requirements.
	* Consumers will create a context and may use multiple under a variety of
	* situations.
	*
	* If your program calls fork(), you should initialize a new bson_context_t
	* using bson_context_init().
	*
	* If you are using threading, it is suggested that you use a bson_context_t
	* per thread for best performance. Alternatively, you can initialize the
	* bson_context_t with BSON_CONTEXT_THREAD_SAFE, although a performance penalty
	* will be incurred.
	*
	* Many functions will require that you provide a bson_context_t such as OID
	* generation.
	*
	* This structure is opaque in that you cannot see the contents of the
	* structure. However, it is stack allocatable in that enough padding is
	* provided in _bson_context_t to hold the structure.
	*/
	public struct bson_context_t;

	/**
	* bson_json_opts_t:
	*
	* This structure is used to pass options for serializing BSON into extended
	* JSON to the respective serialization methods.
	*
	* max_len can be either a non-negative integer, or BSON_MAX_LEN_UNLIMITED to
	* set no limit for serialization length.
	*/
	public struct bson_json_opts_t;


	/**
	* bson_t:
	*
	* This structure manages a buffer whose contents are a properly formatted
	* BSON document. You may perform various transforms on the BSON documents.
	* Additionally, it can be iterated over using bson_iter_t.
	*
	* See bson_iter_init() for iterating the contents of a bson_t.
	*
	* When building a bson_t structure using the various append functions,
	* memory allocations may occur. That is performed using power of two
	* allocations and realloc().
	*
	* See http://bsonspec.org for the BSON document spec.
	*
	* This structure is meant to fit in two sequential 64-byte cachelines.
	*/

#if BSON_MEMCHECK
	[CRepr]
	public struct bson_t {
		uint32_t flags; /* Internal flags for the bson_t. */
		uint32_t len;   /* Length of BSON data. */
		char *canary;   /* For leak checks. */
		uint8_t[120 - sizeof (char *)] padding;
	}
#else
	[CRepr]
	public struct bson_t
	{
		uint32_t flags; /* Internal flags for the bson_t. */
		uint32_t len; /* Length of BSON data. */
		uint8_t[120] padding; /* Padding for stack allocation. */
	}
#endif

	/**
	* BSON_INITIALIZER:
	*
	* This macro can be used to initialize a #bson_t structure on the stack
	* without calling bson_init().
	*
	* |[
	* bson_t b = BSON_INITIALIZER;
	* ]|
	*/
	// #ifdef BSON_MEMCHECK
	// #define BSON_INITIALIZER          \
	// {                              \
	//     3, 5, bson_malloc (1), {5}, \
	// }
	// #else
	// #define BSON_INITIALIZER \
	// {                     \
	//     3, 5,              \
	//     {                  \
	//         5               \
	//     }                  \
	// }
	// #endif


	// BSON_STATIC_ASSERT2 (bson_t, sizeof (bson_t) == 128);


	/**
	* bson_oid_t:
	*
	* This structure contains the binary form of a BSON Object Id as specified
	* on http://bsonspec.org. If you would like the bson_oid_t in string form
	* see bson_oid_to_string() or bson_oid_to_string_r().
	*/
	struct bson_oid_t
	{
		uint8_t[12] bytes;
	}

	// BSON_STATIC_ASSERT2 (oid_t, sizeof (bson_oid_t) == 12);

	/**
	* bson_decimal128_t:
	*
	* @high The high-order bytes of the decimal128.  This field contains sign,
	*       combination bits, exponent, and part of the coefficient continuation.
	* @low  The low-order bytes of the decimal128.  This field contains the second
	*       part of the coefficient continuation.
	*
	* This structure is a boxed type containing the value for the BSON decimal128
	* type.  The structure stores the 128 bits such that they correspond to the
	* native format for the IEEE decimal128 type, if it is implemented.
	**/
	struct bson_decimal128_t
	{
#if BSON_BYTE_ORDER_LITTLE_ENDIAN
			uint64_t low;
			uint64_t high;
	#elif BSON_BYTE_ORDER_BIG_ENDIAN
			uint64_t high;
			uint64_t low;
#endif
	}


	/**
	* bson_validate_flags_t:
	*
	* This enumeration is used for validation of BSON documents. It allows
	* selective control on what you wish to validate.
	*
	* %BSON_VALIDATE_NONE: No additional validation occurs.
	* %BSON_VALIDATE_UTF8: Check that strings are valid UTF-8.
	* %BSON_VALIDATE_DOLLAR_KEYS: Check that keys do not start with $.
	* %BSON_VALIDATE_DOT_KEYS: Check that keys do not contain a period.
	* %BSON_VALIDATE_UTF8_ALLOW_NULL: Allow NUL bytes in UTF-8 text.
	* %BSON_VALIDATE_EMPTY_KEYS: Prohibit zero-length field names
	*/
	enum bson_validate_flags_t
	{
		BSON_VALIDATE_NONE = 0,
		BSON_VALIDATE_UTF8 = (1 << 0),
		BSON_VALIDATE_DOLLAR_KEYS = (1 << 1),
		BSON_VALIDATE_DOT_KEYS = (1 << 2),
		BSON_VALIDATE_UTF8_ALLOW_NULL = (1 << 3),
		BSON_VALIDATE_EMPTY_KEYS = (1 << 4),
	}


	/**
	* bson_type_t:
	*
	* This enumeration contains all of the possible types within a BSON document.
	* Use bson_iter_type() to fetch the type of a field while iterating over it.
	*/
	enum bson_type_t
	{
		BSON_TYPE_EOD = 0x00,
		BSON_TYPE_DOUBLE = 0x01,
		BSON_TYPE_UTF8 = 0x02,
		BSON_TYPE_DOCUMENT = 0x03,
		BSON_TYPE_ARRAY = 0x04,
		BSON_TYPE_BINARY = 0x05,
		BSON_TYPE_UNDEFINED = 0x06,
		BSON_TYPE_OID = 0x07,
		BSON_TYPE_BOOL = 0x08,
		BSON_TYPE_DATE_TIME = 0x09,
		BSON_TYPE_NULL = 0x0A,
		BSON_TYPE_REGEX = 0x0B,
		BSON_TYPE_DBPOINTER = 0x0C,
		BSON_TYPE_CODE = 0x0D,
		BSON_TYPE_SYMBOL = 0x0E,
		BSON_TYPE_CODEWSCOPE = 0x0F,
		BSON_TYPE_INT32 = 0x10,
		BSON_TYPE_TIMESTAMP = 0x11,
		BSON_TYPE_INT64 = 0x12,
		BSON_TYPE_DECIMAL128 = 0x13,
		BSON_TYPE_MAXKEY = 0x7F,
		BSON_TYPE_MINKEY = 0xFF,
	}


	/**
	* bson_subtype_t:
	*
	* This enumeration contains the various subtypes that may be used in a binary
	* field. See http://bsonspec.org for more information.
	*/
	enum bson_subtype_t
	{
		BSON_SUBTYPE_BINARY = 0x00,
		BSON_SUBTYPE_FUNCTION = 0x01,
		BSON_SUBTYPE_BINARY_DEPRECATED = 0x02,
		BSON_SUBTYPE_UUID_DEPRECATED = 0x03,
		BSON_SUBTYPE_UUID = 0x04,
		BSON_SUBTYPE_MD5 = 0x05,
		BSON_SUBTYPE_ENCRYPTED = 0x06,
		BSON_SUBTYPE_COLUMN = 0x07,
		BSON_SUBTYPE_SENSITIVE = 0x08,
		BSON_SUBTYPE_USER = 0x80,
	}


	/*
	*--------------------------------------------------------------------------
	*
	* bson_value_t --
	*
	*       A boxed type to contain various bson_type_t types.
	*
	* See also:
	*       bson_value_copy()
	*       bson_value_destroy()
	*
	*--------------------------------------------------------------------------
	*/
	[CRepr]
	public struct bson_value_t
	{
		bson_type_t value_type;
		int32_t padding;

		/**/ [Union] struct
		{
			bson_oid_t v_oid;
			int64_t v_int64;
			int32_t v_int32;
			int8_t v_int8;
			double v_double;
			bool v_bool;
			int64_t v_datetime;
			struct
			{
				uint32_t timestamp;
				uint32_t increment;
			} v_timestamp;
			struct
			{
				char* str;
				uint32_t len;
			} v_utf8;
			struct
			{
				uint8_t* data;
				uint32_t data_len;
			} v_doc;
			struct
			{
				uint8_t* data;
				uint32_t data_len;
				bson_subtype_t subtype;
			} v_binary;
			struct
			{
				char* regex;
				char* options;
			} v_regex;
			struct
			{
				char* collection;
				uint32_t collection_len;
				bson_oid_t oid;
			} v_dbpointer;
			struct
			{
				char* code;
				uint32_t code_len;
			} v_code;
			struct
			{
				char* code;
				uint8_t* scope_data;
				uint32_t code_len;
				uint32_t scope_len;
			} v_codewscope;
			struct
			{
				char* symbol;
				uint32_t len;
			} v_symbol;
			bson_decimal128_t v_decimal128;
		} value;
	}


	/**
	* bson_iter_t:
	*
	* This structure manages iteration over a bson_t structure. It keeps track
	* of the location of the current key and value within the buffer. Using the
	* various functions to get the value of the iter will read from these
	* locations.
	*
	* This structure is safe to discard on the stack. No cleanup is necessary
	* after using it.
	*/
	struct bson_iter_t
	{
		uint8_t* raw; /* The raw buffer being iterated. */
		uint32_t len; /* The length of raw. */
		uint32_t off; /* The offset within the buffer. */
		uint32_t type; /* The offset of the type byte. */
		uint32_t key; /* The offset of the key byte. */
		uint32_t d1; /* The offset of the first data byte. */
		uint32_t d2; /* The offset of the second data byte. */
		uint32_t d3; /* The offset of the third data byte. */
		uint32_t d4; /* The offset of the fourth data byte. */
		uint32_t next_off; /* The offset of the next field. */
		uint32_t err_off; /* The offset of the error. */
		bson_value_t value; /* Internal value for various state. */
	}

	/**
	* bson_reader_t:
	*
	* This structure is used to iterate over a sequence of BSON documents. It
	* allows for them to be iterated with the possibility of no additional
	* memory allocations under certain circumstances such as reading from an
	* incoming mongo packet.
	*/
	[CRepr]
	public struct bson_reader_t
	{
		uint32_t type;
		/**< private >**/
	}


	/**
	* bson_visitor_t:
	*
	* This structure contains a series of pointers that can be executed for
	* each field of a BSON document based on the field type.
	*
	* For example, if an int32 field is found, visit_int32 will be called.
	*
	* When visiting each field using bson_iter_visit_all(), you may provide a
	* data pointer that will be provided with each callback. This might be useful
	* if you are marshaling to another language.
	*
	* You may pre-maturely stop the visitation of fields by returning true in your
	* visitor. Returning false will continue visitation to further fields.
	*/
	[CRepr]
	struct bson_visitor_t
	{
		/* run before / after descending into a document */
		function bool visit_before(bson_iter_t* iter, char* key, void* data);
		function bool visit_after(bson_iter_t* iter, char* key, void* data);
		/* corrupt BSON, or unsupported type and visit_unsupported_type not set */
		function void visit_corrupt(bson_iter_t* iter, void* data);
		/* normal bson field callbacks */
		function bool visit_double(bson_iter_t* iter, char* key, double v_double, void* data);
		function bool visit_utf8(bson_iter_t* iter, char* key, size_t v_utf8_len, char* v_utf8, void* data);
		function bool visit_document(bson_iter_t* iter, char* key, bson_t* v_document, void* data);
		function bool visit_array(bson_iter_t* iter, char* key, bson_t* v_array, void* data);
		function bool visit_binary(bson_iter_t* iter, char* key, bson_subtype_t v_subtype, size_t v_binary_len, uint8_t* v_binary, void* data);
		/* normal field with deprecated "Undefined" BSON type */
		function bool visit_undefined(bson_iter_t* iter, char* key, void* data);
		function bool visit_oid(bson_iter_t* iter, char* key, bson_oid_t* v_oid, void* data);
		function bool visit_bool(bson_iter_t* iter, char* key, bool v_bool, void* data);
		function bool visit_date_time(bson_iter_t* iter, char* key, int64_t msec_since_epoch, void* data);
		function bool visit_null(bson_iter_t* iter, char* key, void* data);
		function bool visit_regex(bson_iter_t* iter, char* key, char* v_regex, char* v_options, void* data);
		function bool visit_dbpointer(bson_iter_t* iter, char* key, size_t v_collection_len, char* v_collection, bson_oid_t* v_oid, void* data);
		function bool visit_code(bson_iter_t* iter, char* key, size_t v_code_len, char* v_code, void* data);
		function bool visit_symbol(bson_iter_t* iter, char* key, size_t v_symbol_len, char* v_symbol, void* data);
		function bool visit_codewscope(bson_iter_t* iter, char* key, size_t v_code_len, char* v_code, bson_t* v_scope, void* data);
		function bool visit_int32(bson_iter_t* iter, char* key, int32_t v_int32, void* data);
		function bool visit_timestamp(bson_iter_t* iter, char* key, uint32_t v_timestamp, uint32_t v_increment, void* data);
		function bool visit_int64(bson_iter_t* iter, char* key, int64_t v_int64, void* data);
		function bool visit_maxkey(bson_iter_t* iter, char* key, void* data);
		function bool visit_minkey(bson_iter_t* iter, char* key, void* data);
		/* if set, called instead of visit_corrupt when an apparently valid BSON includes an unrecognized field type (reading future version of BSON) */
		function void visit_unsupported_type(bson_iter_t* iter, char* key, uint32_t type_code, void* data);
		function bool visit_decimal128(bson_iter_t* iter, char* key, bson_decimal128_t* v_decimal128, void* data);

		void[7]* padding;
	}

	const int BSON_ERROR_BUFFER_SIZE = 503;

	public struct bson_error_t
	{
		uint32_t domain;
		uint32_t code;
		char[BSON_ERROR_BUFFER_SIZE] message;
		uint8_t reserved; // For internal use only!
	}
}