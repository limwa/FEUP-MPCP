#include "stdlib.h"
#include "stdio.h"

extern void prod_complexosV(float *Z1, float *Z2, float *Z, long int n);

int main() {

    float Z1[] = { 1.0, 2.3, -4.5, 4.69, 12.3, 0.0, -1.43, 1.92, 0.34, 1.23 };
    float Z2[] = { 23.3, 5.56, -1.2, 6.7, 420.69, -12.3, -6.4, 3.5, 7.3, 9.8 };
    float Z[10];
    
    long int n = 5;

    prod_complexosV(Z1, Z2, Z, n);

    printf("Z1: [");
    for (int i = 0; i < n - 1; i++) {
        printf("(%.2f + %.2f * i), ", Z1[2 * i], Z1[2 * i + 1]);
    }
    printf("(%.2f + %.2f * i)]\n", Z1[2 * n - 2], Z1[2 * n - 1]);

    printf("Z2: [");
    for (int i = 0; i < n - 1; i++) {
        printf("(%.2f + %.2f * i), ", Z2[2 * i], Z2[2 * i + 1]);
    }
    printf("(%.2f + %.2f * i)]\n", Z2[2 * n - 2], Z2[2 * n - 1]);

    printf("Z: [");
    for (int i = 0; i < n - 1; i++) {
        printf("(%.2f + %.2f * i), ", Z[2 * i], Z[2 * i + 1]);
    }
    printf("(%.2f + %.2f * i)]\n", Z[2 * n - 2], Z[2 * n - 1]);
    
    return EXIT_SUCCESS;
}
