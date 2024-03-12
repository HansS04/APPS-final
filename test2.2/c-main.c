#include <stdio.h>
#include <stdlib.h>

int array[] = {1,2,1,2,1,2};
int xorFun();


int array2[] = {1,2,-3,4,-5};
int absVal();

char character = 'C';
char text[] = "ABCCDCCCcccc";


int count = 0;
int firstAppear = 0;

int findChar();



int main () {

    absVal();
    printf("Xor from array: %d\n", xorFun());

    printf("Positive array: {");
    for (int i = 0; i < 5; i++) {
        printf("%d,", array2[i]);    
    }
    printf("}\n");
    findChar();
    //pozice je od 1
    printf("Char '%c' is %d times and first one on is on %d. position\n", character, count, firstAppear + 1);
    return 0;
}