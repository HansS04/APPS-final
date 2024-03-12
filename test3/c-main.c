#include <stdio.h>

#include <stdint.h>

char character = 'e';
char text[] = "Ahoj svete! EeEe";

int count = 0;
int firstAppear = 0;

int my_strchr();

char buff[255]="55";
int num = 0;


int str2int(char *str, int *num); 

long var = 0xf0f0f0;
char array[] = {0,1,2,10,15};
int size = 5;


int not_bits();


int main()

{
    my_strchr(text, character, firstAppear);
    printf("Char '%c' is %d times and first one on is on %d. position\n", character, count, firstAppear );
    
    int oneCount = not_bits(&var);
    printf("Count in ones for %lx is %d\n",var, oneCount);

    str2int(buff, &num);
    printf("Parsed number: %d\n", num); 


    return 0;
}