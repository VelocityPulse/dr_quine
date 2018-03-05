#include <stdio.h>
/*
	comment
*/
#define one
#define F1(f, a){if (f == NULL) ; else fprintf(f, a, 10, 34, a, 9);}
#define MAIN(X) int main(){char *a = "#include <stdio.h>%c/*%1$c%4$ccomment%1$c*/%1$c#define one%1$c#define F1(f, a){if (f == NULL) ; else fprintf(f, a, 10, 34, a, 9);}%1$c#define MAIN(X) int main(){char *a = %c%s%2$c;FILE *f = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c);F1(f, a);}%1$cMAIN(1)%1$c";FILE *f = fopen("Grace_kid.c", "w");F1(f, a);}
MAIN(1)
