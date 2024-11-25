#ifndef BLAKE2B_REF_IMPL_H
#define BLAKE2B_REF_IMPL_H

#include "blake2.h"

#ifdef __cplusplus
extern "C" {
#endif

// Implementation of blake2b functions
#include "blake2b-ref.cpp"

#ifdef __cplusplus
}
#endif

#endif // BLAKE2B_REF_IMPL_H
