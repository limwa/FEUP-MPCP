#include "stdlib.h"
#include "stdio.h"

extern long long int Exercise(long long int num);

int main() {

    printf("%ld", Exercise(-123));
    printf("%ld", Exercise(456));

    
    return EXIT_SUCCESS;
}