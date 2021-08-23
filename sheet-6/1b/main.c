#include "stdlib.h"
#include "stdio.h"

extern double Exercise(int w, double x);

int main() {

    double res = Exercise(7, 7.1);
    printf("Resultado: %f", res);

    return EXIT_SUCCESS;
}
