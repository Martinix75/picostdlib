import std/os, std/strutils

const picoSdkPath* {.strdefine.} = os.getEnv("PICO_SDK_PATH").replace('\\', DirSep)
const cmakeBinaryDir* {.strdefine.} = os.getEnv("CMAKE_BINARY_DIR").replace('\\', DirSep)
const cmakeSourceDir* {.strdefine.} = os.getEnv("CMAKE_SOURCE_DIR").replace('\\', DirSep)

const armNoneEabiIncludePath* = (staticExec("arm-none-eabi-gcc -print-sysroot").strip().replace('\\', DirSep) / "include").normalizedPath()

func futharkRenameCallback*(name: string; kind: string; partof: string): string =
  result = name
  if kind in ["struct", "anon", "typedef", "enum"] and result.len > 0:
    removePrefix(result, "struct_")
    removePrefix(result, "enum_")
    if result.len > 0:
      result[0] = result[0].toUpperAscii()
