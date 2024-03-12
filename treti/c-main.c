#include <stdio.h>

#include <stdint.h>

int pozice_max (int *tp_ipole, int t_N);

void int2str (int t_num, char *tp_str);

int cetnost (char *tp_str);

int main()

{
    int l_pole[10] = {11,2,3,4,5,6,7,8,9,10};
    printf("pozice max je %d\n", pozice_max(l_pole, 10));
    char cislo[128];
    int2str( 65535, cislo);
    printf("cislo %s\n", cislo);

    printf("cetnost vyhral znak %c\n", cetnost("Ahoj programotari!"));

    return 0;

}