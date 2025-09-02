project('libc_ucontext', 'cpp')

stack_sources = files(
  'secondary_stack.cc',
)

if target_machine.cpu_family() == 'x86_64'
  subdir('x86_64')
elif target_machine.cpu_family() == 'aarch64'
  subdir('arm_64')
else 
  error('Unsupported platform in meson.build: ', target_machine.cpu_family())
endif

add_project_link_arguments('-Wl,-z noexecstack', '-Wl,--hash-style=sysv', language: 'cpp')

shared_library('libc_ucontext',
   sources: sources + stack_sources,
   install: true,
   override_options: ['b_lundef=false'],
   name_prefix: '',
   name_suffix: 'lib.so',
   include_directories: include_directories('include'),
)

install_headers('include/genode_secondary_stack.h')
