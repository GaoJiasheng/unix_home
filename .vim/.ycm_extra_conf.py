#!/usr/bin/env python
#coding=utf-8
#author :zhouxiaolong
#2015-11-09 15:06:05

import os   
import ycm_core   
flags = [   
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wc++98-compat',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
# You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
# source code needs it.
    '-DUSE_CLANG_COMPLETER',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
    '-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
    '-x',
    'c++',  
    '-isystem',  
    '/usr/include/',   
    '-isystem',  
    '/usr/local/include/',   
    '-isystem',  
    '/usr/local/include/c++', 
    '-isystem',  
    '/usr/local/include/boost', 
]   
compilation_database_folder = ''   
if compilation_database_folder:   
  database = ycm_core.CompilationDatabase( compilation_database_folder )   
else:   
  database = None   
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]   
def DirectoryOfThisScript():   
  return os.path.dirname( os.path.abspath( __file__ ) )   
def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):   
  if not working_directory:   
    return list( flags )   
  new_flags = []   
  make_next_absolute = False   
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]   
  for flag in flags:   
    new_flag = flag   
    if make_next_absolute:   
      make_next_absolute = False   
      if not flag.startswith( '/' ):   
        new_flag = os.path.join( working_directory, flag )   
    for path_flag in path_flags:   
      if flag == path_flag:   
        make_next_absolute = True   
        break   
      if flag.startswith( path_flag ):   
        path = flag[ len( path_flag ): ]   
        new_flag = path_flag + os.path.join( working_directory, path )   
        break   
    if new_flag:   
      new_flags.append( new_flag )   
  return new_flags   
def IsHeaderFile( filename ):   
  extension = os.path.splitext( filename )[ 1 ]   
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]   
def GetCompilationInfoForFile( filename ):   
  if IsHeaderFile( filename ):   
    basename = os.path.splitext( filename )[ 0 ]   
    for extension in SOURCE_EXTENSIONS:   
      replacement_file = basename + extension   
      if os.path.exists( replacement_file ):   
        compilation_info = database.GetCompilationInfoForFile(          replacement_file )  
        if compilation_info.compiler_flags_:   
          return compilation_info   
    return None   
  return database.GetCompilationInfoForFile( filename )   
def FlagsForFile( filename, **kwargs ):   
  if database:   
    compilation_info = GetCompilationInfoForFile( filename )   
    if not compilation_info:   
      return None   
    final_flags = MakeRelativePathsInFlagsAbsolute(   
      compilation_info.compiler_flags_,   
      compilation_info.compiler_working_dir_ )   
  else:   
    relative_to = DirectoryOfThisScript()   
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )   
  return {   
    'flags': final_flags,   
    'do_cache': True   
  }  
