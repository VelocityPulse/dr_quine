#include<stdio.h>
#include<stdlib.h>
#include<strings.h>
#include<unistd.h>
void copyexec(FILE *f, char *buff, char *a, int i) {
	fprintf(f, a, i, 10, 34, a, 9);
	fclose(f);
	sprintf(buff, "gcc Sully_%1$d.c -Wall -Werror -Wextra -o Sully_%1$d && ./Sully_%1$d", i);
	system(buff);
}
int main() {
	int i = 5;
	if (i <= 0) return 0;
	char buff[100] = {0};
	sprintf(buff, "Sully_%d.c", i);
	if (access(buff, F_OK) != -1) i--;
	sprintf(buff, "Sully_%d.c", i);
	FILE *f = fopen(buff, "w");
	if (f == NULL) return 0;
	char *a = "#include<stdio.h>%2$c#include<stdlib.h>%2$c#include<strings.h>%2$c#include<unistd.h>%2$cvoid copyexec(FILE *f, char *buff, char *a, int i) {%2$c%5$cfprintf(f, a, i, 10, 34, a, 9);%2$c%5$cfclose(f);%2$c%5$csprintf(buff, %3$cgcc Sully_%%1$d.c -Wall -Werror -Wextra -o Sully_%%1$d && ./Sully_%%1$d%3$c, i);%2$c%5$csystem(buff);%2$c}%2$cint main() {%2$c%5$cint i = %1$d;%2$c%5$cif (i <= 0) return 0;%2$c%5$cchar buff[100] = {0};%2$c%5$csprintf(buff, %3$cSully_%%d.c%3$c, i);%2$c%5$cif (access(buff, F_OK) != -1) i--;%2$c%5$c%2$c%5$csprintf(buff, %3$cSully_%%d.c%3$c, i);FILE *f = fopen(buff, %3$cw%3$c);%2$c%5$cif (f == NULL) return 0;%2$c%5$cchar *a = %3$c%s%3$c;%2$c%5$ccopyexec(f, buff, a, i);%2$c}%2$c";
	copyexec(f, buff, a, i);
}
