#include "stdlib.h"
#include "stdio.h"

extern double normV(double *ptV, long int n);

int main() {

    double coords[] = { 1.1, 2.0, 3.3, 4.5, 7.7, 6.2, 7.4, -8.5 };
    long int n = 8;

    printf("Vector: [");
    for (int i = 0; i < n - 1; i++) {
        printf("%.1f, ", coords[i]);
    }
    printf("%.1f]\n", coords[n - 1]);

    double length = normV(coords, n);
    printf("Length: %f\n", length);
    
    return EXIT_SUCCESS;
}
