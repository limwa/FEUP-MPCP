#include "stdlib.h"
#include "stdio.h"

extern double Exercise(double x1, double y1, double x2, double y2);

int main() {

    double res = Exercise(0, 0, -1, 1);
    printf("Resultado: %f\n", res);
    
    return EXIT_SUCCESS;
}
