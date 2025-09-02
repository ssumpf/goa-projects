#pragma once

#include <pthread.h>

#ifdef __cplusplus
extern "C" {
#endif

void *genode_allocate_secondary_stack(char const *name, unsigned long stack_size);

unsigned long genode_stack_area_virtual_base(void);
unsigned long genode_stack_virtual_size(void);

int genode_pthread_create_from_thread(pthread_t *, void *stack_address);

#ifdef __cplusplus
} /* extern "C" */
#endif
