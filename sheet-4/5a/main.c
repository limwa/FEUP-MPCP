#include "stdlib.h"
#include "stdio.h"

extern int POS1msb(long int n);

int main() {

    printf("%ld: %d\n", 0xF000000000000000, POS1msb(0xF000000000000000));
    printf("%ld: %d\n", 0xF00000000000000, POS1msb(0xF00000000000000));
    printf("%ld: %d\n", 0xF0000000000000, POS1msb(0xF0000000000000));
    printf("%ld: %d\n", 0x70000000000000, POS1msb(0x70000000000000));
    printf("%ld: %d\n", 0x0, POS1msb(0x0));

    return EXIT_SUCCESS;
}