#include "stdlib.h"
#include "stdio.h"

extern int IsPalindrome(const char*);

int main() {

    printf("%s", IsPalindrome("acc  a") ? "true" : "false");
    
    return EXIT_SUCCESS;
}