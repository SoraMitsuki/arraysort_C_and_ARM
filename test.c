#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv){
    char *p = malloc(19); // Allocation 1
    strncpy(p, "the quick brown fox", 19);
    free(p);
    p = malloc(12); // Allocation 2
    free(p);
    p = malloc(16); // Allocation 3
    free(p);
    return 0;
}
