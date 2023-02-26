#include "ByteReverse.h"

u_int8_t FlipByte(u_int8_t& num) {
    u_int8_t reversedNum;
    reversedNum = (((num & 0b00001111) << 4) | ((num & 0b11110000) >> 4));
    reversedNum = (((reversedNum & 0b00110011) << 2) | ((reversedNum & 0b11001100) >> 2));
    reversedNum = (((reversedNum & 0b01010101) << 1) | ((reversedNum & 0b10101010) >> 1));
    return reversedNum;
}
