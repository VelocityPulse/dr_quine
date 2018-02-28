#include <stdio.h>
/* comment */
#define defineai
#define defineb
#define MAIN(X) int main(){char *a = "#include <stdio.h>%c/* comment */%1$cint main(){char*a=%c%s%2$c;FILE *f = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c);printf(f, a);}%1$cvoid print(FILE *f, char *a){if (f != NULL) return ;fprintf(f, a, 10, 34, a);}%1$cMAIN(1)%1$c";FILE *f = fopen("Grace_kid.c", "w");print(f, a);}
void print(FILE *f, char *a){if (f == NULL) return ;fprintf(f, a, 10, 34, a);}
MAIN(1)
