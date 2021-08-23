#include "stdlib.h"
#include "stdio.h"

extern double Exercise(double radius);

int main() {

    double area = Exercise(2);
    printf("Resultado: %f\n", area);
    
    return EXIT_SUCCESS;
}
