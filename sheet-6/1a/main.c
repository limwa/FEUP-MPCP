#include "stdlib.h"
#include "stdio.h"

extern double Exercise(double b, double m, double n);

int main() {

    double res = Exercise(7.8, 3.6, 7.1);
    printf("Resultado: %f", res);

    return EXIT_SUCCESS;
}
