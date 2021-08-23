#include "stdlib.h"
#include "stdio.h"

extern void mirrorSeq(float *pt, int n);

int main() {

    float coords[] = { 1.1, 2.0, 3.3, 4.5, 7.7, 6.2, 7.4, -8.5 };
    int n = 4;

    printf("Antes: [");
    for (int i = 0; i < 2 * n - 2; i++) {
        printf("%.1f, ", coords[i]);
    }
    printf("%.1f, %.1f]\n", coords[2 * n - 2], coords[2 * n - 1]);

    mirrorSeq(coords, n);

    printf("Depois: [");
    for (int i = 0; i < 2 * n - 2; i++) {
        printf("%.1f, ", coords[i]);
    }
    printf("%.1f, %.1f]\n", coords[2 * n - 2], coords[2 * n - 1]);
    
    return EXIT_SUCCESS;
}
