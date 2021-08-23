#include "stdlib.h"
#include "stdio.h"

#define LENGTH 12

extern void Exercise(int* src, long long* dest, unsigned int nelem);

int main() {
    int src[LENGTH] = { 1, 2, 6, -7, 10, -4, -3, -3, 2, -2, 6, 0 };
    long long *dest = (long long*) malloc(LENGTH * sizeof(long long));

    puts("src:");
    for (int i = 0; i < LENGTH; i++) {
        printf(" %d", src[i]);
    }
    puts("\n");

    puts("dest:");
    for (int i = 0; i < LENGTH; i++) {
        printf(" %ld", dest[i]);
    }
    puts("\n\n");

    puts("Executing...\n\n");

    Exercise(src, dest, LENGTH);

    puts("src:");
    for (int i = 0; i < LENGTH; i++) {
        printf(" %d", src[i]);
    }
    puts("\n");

    puts("dest:");
    for (int i = 0; i < LENGTH; i++) {
        printf(" %ld", dest[i]);
    }
    puts("\n\n");
    
    return EXIT_SUCCESS;
}