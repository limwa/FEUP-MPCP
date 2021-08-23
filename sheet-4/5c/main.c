#include "stdlib.h"
#include "stdio.h"

int NCAP(int n);

int main() {

    printf("%X: %s\n", 0x0, NCAP(0x0) ? "true" : "false");
    printf("%X: %s\n", 0x1, NCAP(0x1) ? "true" : "false");
    printf("%X: %s\n", 0xFFFFFFFF, NCAP(0xFFFFFFFF) ? "true" : "false");
    printf("%X: %s\n", 0xF8FFFF1F, NCAP(0xF8FFFF1F) ? "true" : "false");
    
    return EXIT_SUCCESS;
}