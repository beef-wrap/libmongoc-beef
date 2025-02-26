using System;
using System.Interop;

namespace libbsonBeef;

extension libbson
{
	public function void* bson_realloc_func(void* mem, size_t num_bytes, void* ctx);

	public struct bson_mem_vtable_t
	{
		function void* malloc(size_t num_bytes);
		function void* calloc(size_t n_members, size_t num_bytes);
		function void* realloc(void* mem, size_t num_bytes);
		function void free(void* mem);
		function void* aligned_alloc(size_t alignment, size_t num_bytes);
		void[3]* padding;
	}

	[CLink] public static extern void bson_mem_set_vtable(bson_mem_vtable_t* vtable);

	[CLink] public static extern void bson_mem_restore_vtable(void);

	[CLink] public static extern void* bson_malloc(size_t num_bytes);

	[CLink] public static extern void* bson_malloc0(size_t num_bytes);

	[CLink] public static extern void* bson_aligned_alloc(size_t alignment, size_t num_bytes);

	[CLink] public static extern void* bson_aligned_alloc0(size_t alignment, size_t num_bytes);

	[CLink] public static extern void* bson_realloc(void* mem, size_t num_bytes);

	[CLink] public static extern void* bson_realloc_ctx(void* mem, size_t num_bytes, void* ctx);

	[CLink] public static extern void bson_free(void* mem);

	[CLink] public static extern void bson_zero_free(void* mem, size_t size);
}