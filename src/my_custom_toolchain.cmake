include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_CROSSCOMPILING 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(PLATFORM_NAME "LwIP")

# Makefile flags
set(ARCH_CPU_FLAGS "-mcpu=cortex-r5 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -Wno-dev -Wno-unused-parameter -Wno-unused-value -Wno-unused-variable -Wno-unused-but-set-variable -DUSE_HAL_DRIVER -D_TIMEVAL_DEFINED -O0 -Wall -fdata-sections -ffunction-sections")
set(ARCH_OPT_FLAGS "")

set(CMAKE_C_COMPILER /armr5-toolchain/bin/armr5-none-eabi-gcc)

set(CMAKE_C_COMPILER_WORKS 1 CACHE INTERNAL "")

set(CMAKE_C_FLAGS_INIT "-std=c11 ${ARCH_CPU_FLAGS} ${ARCH_OPT_FLAGS} -DCLOCK_MONOTONIC=0" CACHE STRING "" FORCE)

set(__BIG_ENDIAN__ 0)