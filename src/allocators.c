#include "allocators.h"

//int absoluteUsedMemory = 0;
//int usedMemory = 0;

void * __freertos_allocate(size_t size, void * state){
  (void) state;
  LPRINTF("-- Alloc %d (prev: %d B)\r\n",size, xPortGetFreeHeapSize());
//  absoluteUsedMemory += size;
//  usedMemory += size;

  LPRINTF("Return for the allocate function w parameter size = %d\r\n", size);

  return pvPortMalloc(size);
}

void __freertos_deallocate(void * pointer, void * state){
  (void) state;
  LPRINTF("-- Free 0x%x (prev: %d B)\r\n", pointer, xPortGetFreeHeapSize());
  if (NULL != pointer)
  {
//	  LPRINTF("Pointer is not null.\r\n");
//	  usedMemory -= getBlockSize(pointer);
//	  LPRINTF("usedMemory var updated: %d\r\n", usedMemory);
	  vPortFree(pointer);
  }
  else
  {
	  LPERROR("Trying to deallocate a null pointed. Doing nothing.\r\n");
  }
}

void * __freertos_reallocate(void * pointer, size_t size, void * state){
  (void) state;
  LPRINTF("-- Realloc 0x%x -> %d (prev: %d B)\r\n", pointer, size, xPortGetFreeHeapSize());
//  absoluteUsedMemory += size;
//  usedMemory += size;
  if (NULL == pointer)
  {
    return __freertos_allocate(size, state);
  }
  else
  {
//    usedMemory -= getBlockSize(pointer);
//
//    return pvPortRealloc(pointer,size);

	  __freertos_deallocate(pointer, state);
	  return __freertos_allocate(size, state);

  }
}

void * __freertos_zero_allocate(size_t number_of_elements, size_t size_of_element, void * state){
  (void) state;
  LPRINTF("-- Calloc %d x %d = %d -> (prev: %d B)\r\n",number_of_elements,size_of_element, number_of_elements*size_of_element, xPortGetFreeHeapSize());
//  absoluteUsedMemory += number_of_elements*size_of_element;
//  usedMemory += number_of_elements*size_of_element;

  return pvPortCalloc(number_of_elements,size_of_element);
}
