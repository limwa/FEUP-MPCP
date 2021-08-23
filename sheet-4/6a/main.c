#include "stdlib.h"
#include "stdio.h"

extern long long int Exercise(long long int num);

int main() {

    printf("%lX\n", Exercise(0x6f4a189c1b432da0));
    
    return EXIT_SUCCESS;
}