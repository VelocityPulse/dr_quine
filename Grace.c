#include <stdio.h>
/*
	comment
*/
#define one
#define two
#define MAIN(X) int main(){char *a = "#include <stdio.h>%c/*%1$c%4$ccomment%1$c*/%1$c#define one%1$c#define two%1$c#define MAIN(X) int main(){char *a = %c%s%2$c;FILE *f = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c);print(f, a);}%1$cvoid print(FILE *f, char *a){if (f == NULL) return ;fprintf(f, a, 10, 34, a, 9);}%1$cMAIN(1)%1$c";FILE *f = fopen("Grace_kid.c", "w");print(f, a);}
void print(FILE *f, char *a){if (f == NULL) return ;fprintf(f, a, 10, 34, a, 9);}
MAIN(1)
