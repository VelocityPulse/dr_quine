#include<stdio.h>
#include<stdlib.h>
#define INDEX 5
#define INDEX_NEXT INDEX - 1
void copyexec(FILE *f, char *buff, char *a) {
	fprintf(f, a, INDEX_NEXT, 10, 34, a, 9);
	fclose(f);
	sprintf(buff, "gcc Sully_%1$d.c -Wall -Werror -Wextra -o Sully_%1$d && ./Sully_%1$d", INDEX_NEXT);
	system(buff);
}
int main() {
	if (INDEX <= 0) return 0;
	char buff[100] = {0};
	sprintf(buff, "Sully_%d.c", INDEX_NEXT);
	FILE *f = fopen(buff, "w");
	if (f == NULL) return 0;
	char *a = "#include<stdio.h>%2$c#include<stdlib.h>%2$c#define INDEX %1$d%2$c#define INDEX_NEXT INDEX - 1%2$cvoid copyexec(FILE *f, char *buff, char *a) {%2$c%5$cfprintf(f, a, INDEX_NEXT, 10, 34, a, 9);%2$c%5$cfclose(f);%2$c%5$csprintf(buff, %3$cgcc Sully_%%1$d.c -Wall -Werror -Wextra -o Sully_%%1$d && ./Sully_%%1$d%3$c, INDEX_NEXT);%2$c%5$csystem(buff);%2$c}%2$cint main() {%2$c%5$cif (INDEX <= 0) return 0;%2$c%5$cchar buff[100] = {0};%2$c%5$csprintf(buff, %3$cSully_%%d.c%3$c, INDEX_NEXT);%2$c%5$cFILE *f = fopen(buff, %3$cw%3$c);%2$c%5$cif (f == NULL) return 0;%2$c%5$cchar *a = %3$c%s%3$c;%2$c%5$ccopyexec(f, buff, a);%2$c}%2$c";
	copyexec(f, buff, a);
}
