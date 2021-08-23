#include "stdlib.h"
#include "stdio.h"

extern void Exercise(char*);

int main() {

    char msg[] = "hello";
    Exercise(msg);
    
    return EXIT_SUCCESS;
}
