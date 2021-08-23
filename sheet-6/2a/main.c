#include "stdlib.h"
#include "stdio.h"

extern float Exercise(float a, float b, float c, float d);

int main() {

    float res = Exercise(1.3, 5.9, 2.1, -2.3);
    printf("Resultado: %f\n", res);

    return EXIT_SUCCESS;
}
