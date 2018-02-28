#include<stdio.h>
#include<stdlib.h>
#include<strings.h>
#define INDEX 5
#define INDEX_N INDEX - 1
void copyexec(FILE *f, char *buff, char *a) {
	fprintf(f, a, INDEX_N, 10, 34, a, 9);
	sprintf(buff, "gcc Sully_%1$d.c -o Sully_%1$d", INDEX_N);
	system(buff);
	bzero(buff, 50);
	sprintf(buff, "./Sully_%d", INDEX_N);
	system(buff);
}
int main() {
	if (INDEX <= 1) return 0;
	char buff[50] = {0};
	sprintf(buff, "Sully_%d.c", INDEX_N);
	FILE *f = fopen(buff, "w");
	if (f == NULL) return 0;
	char *a = "#include<stdio.h>%2$c#include<stdlib.h>%2$c#include<strings.h>%2$c#define INDEX %1$d%2$c#define INDEX_N INDEX - 1%2$cvoid copyexec(FILE *f, char *buff, char *a) {%2$c%5$cfprintf(f, a, INDEX_N, 10, 34, a, 9);%2$c%5$csprintf(buff, %3$cgcc Sully_%%1$d.c -o Sully_%%1$d%3$c, INDEX_N);%2$c%5$csystem(buff);%2$c%5$cbzero(buff, 50);%2$c%5$csprintf(buff, %3$c./Sully_%%d%3$c, INDEX_N);%2$c%5$csystem(buff);%2$c}%2$cint main() {%2$c%5$cif (INDEX <= 1) return 0;%2$c%5$cchar buff[50] = {0};%2$c%5$csprintf(buff, %3$cSully_%%d.c%3$c, INDEX_N);%2$c%5$cFILE *f = fopen(buff, %3$cw%3$c);%2$c%5$cif (f == NULL) return 0;%2$c%5$cchar *a = %3$c%s%3$c;%2$c%5$ccopyexec(f, buff, a);%2$c}%2$c";
	copyexec(f, buff, a);
}
