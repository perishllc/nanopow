// pow_lib.cpp
#include "vendor/blake2/blake2.h"
// #include "vendor/blake2/blake2b-ref.cpp"
#include "vendor/blake2/blake2-ref-impl.h"
#include "vendor/xorshift.hpp"
#include <random>
#include <string>
#include <cstring>

#ifdef _WIN32
#define EXPORT __declspec(dllexport)
#else
#define EXPORT __attribute__((visibility("default")))
#endif

// Keep your helper functions as is
template<typename T>
T getValueFromChar(char c) {
  if (isdigit(c)) /* '0' .. '9'/
      return c - '0';
  else if (isupper(c)) / 'A' .. 'F'/
      return c - 'A' + 10;
  else / 'a' .. 'f'*/
    return c - 'a' + 10;
}

template<typename T>
T getUIntFromHex(const char *str) {
  T accumulator = 0;
  for (size_t i = 0; isxdigit((unsigned char)str[i]); ++i)
  {
    char c = str[i];
    accumulator *= 16;
    accumulator += getValueFromChar<T>(c);
  }
  return accumulator;
}

void getBytesFromHex(const char *hash, uint8_t *output) {
  int j = 0;
  std::string hex(hash);
  for (unsigned int i = 0; i < hex.length(); i += 2)
  {
    std::string byteString = hex.substr(i, 2);
    uint8_t byte = (uint8_t)strtol(byteString.c_str(), NULL, 16);
    output[j] = byte;
    j++;
  }
}

uint64_t tryToGetWork(const uint8_t *bytes, const uint64_t threshold) {
  uint64_t work;
  uint64_t output = 0;
  blake2b_state hash;
  blake2b_init(&hash, sizeof(output));
  std::xorshift1024star rng;
  const int rangeFrom = 0;
  const int rangeTo = 32767;
  std::random_device randomDevice;
  std::mt19937 generator(randomDevice());
  std::uniform_int_distribution<int> distr(rangeFrom, rangeTo);
  for (int j = 0; j < 16; j++)
    rng.s[j] = distr(generator);
  // 5M iterations
  uint64_t iteration(5000000);
  while (iteration && output < threshold)
  {
    work = rng.next();
    blake2b_update(&hash, reinterpret_cast<uint8_t *>(&work), sizeof(work));
    blake2b_update(&hash, bytes, 32);
    blake2b_final(&hash, reinterpret_cast<uint8_t *>(&output), sizeof(output));
    blake2b_init(&hash, sizeof(output));
    iteration -= 1;
  }
  if (output > threshold)
  // {
    return work;
  // }
  return 0;
}

uint64_t _getPow(const char *hashString, const char *thresholdString) {
  uint8_t *hash;
  getBytesFromHex(hashString, hash);
  uint64_t threshold = getUIntFromHex<uint64_t>(thresholdString);
  return tryToGetWork(hash, threshold);
}

extern "C" {
    EXPORT uint64_t get_proof_of_work(const char* hash_string, const char* threshold_string) {
        return _getPow(hash_string, threshold_string);
    }
}