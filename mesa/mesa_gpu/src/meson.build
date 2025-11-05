project('mesa_gpu', ['cpp', 'c'])

pre_args = [
  '-DHAVE_PTHREAD',
  '-DHAVE_GENODE_PLATFORM',
  '-DHAVE_LIBDRM',
  '-DHAVE_STRUCT_TIMESPEC',
]

add_project_arguments(pre_args, language : ['c', 'cpp'])

egl_files = ['egl/genode_interface.cc', 'egl/platform.c']

shared_library('mesa_gpu-iris',
               [egl_files,
               'iris/drm_init.cc',
               'iris/platform_iris.c'],
               name_prefix : '',
               name_suffix : 'lib.so',
               install: true,
              )
