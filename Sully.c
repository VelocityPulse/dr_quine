#include<stdio.h>
#include<stdlib.h>
#define INDEX 5
void copyexec(FILE *f, char *buff, char *a) {
	fprintf(f,a,INDEX-1,10,34,a,9);
	sprintf(buff, "gcc Sully%1$d.c -o Sully%1$d", INDEX - 1);
	system(buff);
}
int main() {
	if (INDEX <= 1) return 0;
	char buff[50] = {0};
	sprintf(buff, "Sully%d.c", INDEX - 1);
	FILE *f = fopen(buff, "w");
	if (f == NULL) return 0;
	char *a = "#include<stdio.h>%2$c#include<stdlib.h>%2$c#define INDEX %1$d%2$cvoid copyexec(FILE *f, char *buff, char *a) {%2$c%5$cfprintf(f,a,INDEX-1,10,34,a,9);%2$c%5$csprintf(buff, %3$cgcc Sully%%1$d.c -o Sully%%1$d && ./Sully%%1$d %3$c, INDEX - 1);%2$c%5$csystem(buff);%2$c}%2$cint main() {%2$c%5$cif (INDEX <= 1) return 0;%2$c%5$cchar buff[50] = {0};%2$c%5$csprintf(buff, %3$cSully%%d.c%3$c, INDEX - 1);%2$c%5$cFILE *f = fopen(buff, %3$cw%3$c);%2$c%5$cif (f == NULL) return 0;%2$c%5$cchar *a = %3$c%s%3$c;%2$c%5$ccopyexec(f, buff, a);%2$c}%2$c";
	copyexec(f, buff, a);
}
