set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_CROSSCOMPILING 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_INSTALL_LIBDIR /usr/)
set(PLATFORM_NAME "LwIP")


set(ARCH_CPU_FLAGS "-mcpu=cortex-r5 -mthumb -mfpu=vfpv3-d16 -mfloat-abi=hard -DARMR5 -O0 -Wall -fdata-sections -ffunction-sections -fno-tree-loop-distribute-patterns -Wno-unused-parameter -Wno-unused-value -Wno-unused-variable -Wno-unused-function -Wno-unused-but-set-variable -Wl,--gc-sections" CACHE STRING "" FORCE)
set(ARCH_OPT_FLAGS "")

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

set(CMAKE_C_FLAGS_INIT "-std=c11 ${ARCH_CPU_FLAGS} ${ARCH_OPT_FLAGS} -DCLOCK_MONOTONIC=0" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_INIT "-std=c++14 ${ARCH_CPU_FLAGS} ${ARCH_OPT_FLAGS} -DCLOCK_MONOTONIC=0" CACHE STRING "" FORCE)



set(__BIG_ENDIAN__ 0)
