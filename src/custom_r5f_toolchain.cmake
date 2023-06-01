set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_CROSSCOMPILING 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_INSTALL_LIBDIR /usr/)


# Makefile flags
set(ARCH_CPU_FLAGS "-O2 -ffunction-sections -fdata-sections -fno-exceptions -ffreestanding -mcpu=cortex-r5 -nostdlib -mthumb -mfpu=vfpv3-d16 -mfloat-abi=hard -Wall --param max-inline-insns-single=500 -DF_CPU=84000000L -D'RCUTILS_LOG_MIN_SEVERITY=RCUTILS_LOG_MIN_SEVERITY_NONE'" CACHE STRING "" FORCE)
set(ARCH_OPT_FLAGS "")

set(CMAKE_C_COMPILER armr5-none-eabi-gcc)
set(CMAKE_CXX_COMPILER armr5-none-eabi-g++)

set(CMAKE_C_COMPILER_WORKS 1 CACHE INTERNAL "")
set(CMAKE_CXX_COMPILER_WORKS 1 CACHE INTERNAL "")

set(CMAKE_C_FLAGS_INIT "-std=c11 ${ARCH_CPU_FLAGS} ${ARCH_OPT_FLAGS} -DCLOCK_MONOTONIC=0 -D'__attribute__(x)='" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_INIT "-std=c++11 ${ARCH_CPU_FLAGS} -DCLOCK_MONOTONIC=0 -D'__attribute__(x)='" CACHE STRING "" FORCE)

set(__BIG_ENDIAN__ 0)
