#include <base/thread.h>

#include <genode_secondary_stack.h>

using namespace Genode;

extern "C"
void *genode_allocate_secondary_stack(char const *name, unsigned long stack_size)
{
	return Thread::myself()->alloc_secondary_stack(name, stack_size).convert<void *>(
	[&] (void *sp) { return sp; },
	[&] (Thread::Stack_error) {
		error("libc_ucontext: failed to allocate secondary stack");
		return nullptr;
	});
}


extern "C"
unsigned long genode_stack_area_virtual_base(void)
{
	return Thread::stack_area_virtual_base();
}


extern "C"
unsigned long genode_stack_virtual_size(void)
{
	return Thread::stack_virtual_size();
}


namespace Libc {
	int pthread_create_from_thread(pthread_t *, Thread &, void *stack_address);
}

extern "C"
int genode_pthread_create_from_thread(pthread_t *pthread, void *stack_address)
{
	using namespace Libc;
	return pthread_create_from_thread(pthread, *Thread::myself(), stack_address);
}


