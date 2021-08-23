#include <stdio.h>
#include <stdlib.h>

extern int CheckABS( int numx, int tam, int *seq);

int main(void) {
    int x = 20; 
    int tamanho = 8;
    int ve[] = {7, -8, -23, 56, 20, -10, 0, 40};
    int res;         

    res = CheckABS(x, tamanho, ve);
    printf("Foram modificados %d elementos da sequencia ve[]", res);
    
    return EXIT_SUCCESS;
}