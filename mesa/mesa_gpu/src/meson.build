project('mesa_gpu', ['cpp', 'c'])

pre_args = [
  '-DHAVE_PTHREAD',
  '-DHAVE_GENODE_PLATFORM',
  '-DHAVE_LIBDRM',
  '-DHAVE_STRUCT_TIMESPEC',
]

add_project_arguments(pre_args, language : ['c', 'cpp'])

common_files = ['common/genode_interface.cc', 'common/platform.c']

shared_library('mesa_gpu-iris',
               [common_files,
               'iris/drm_init.cc',
               'iris/platform_iris.c'],
               name_prefix : '',
               name_suffix : 'lib.so',
               install: true,
              )

shared_library('mesa_gpu-lima',
               [common_files,
               'lima/drm_init.cc',
               'lima/platform_lima.c'],
               name_prefix : '',
               name_suffix : 'lib.so',
               install: true,
              )

shared_library('mesa_gpu-etnaviv',
               [common_files,
               'etnaviv/drm_init.cc',
               'etnaviv/platform_etnaviv.c'],
               name_prefix : '',
               name_suffix : 'lib.so',
               install: true,
              )

shared_library('mesa_gpu-softpipe',
               [common_files,
               'softpipe/platform_softpipe.c'],
               name_prefix : '',
               name_suffix : 'lib.so',
               install: true,
              )
