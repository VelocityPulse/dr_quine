#include<stdio.h>
#define INDEX 5
void copyexec(FILE *f, char *a) {
	fprintf(f,a,INDEX-1,10,34,a,9);
}
int main() {
	if (INDEX <= 1) return 0;
	char buff[50] = {0};
	sprintf(buff, "Sully_%d.c", INDEX - 1);
	FILE *f = fopen(buff, "w");
	if (f == NULL) return 0;
	char *a = "#include<stdio.h>%2$c#define INDEX %1$d%2$cvoid copyexec(FILE *f, char *a) {%2$c%5$cfprintf(f,a,INDEX-1,10,34,a,9);%2$c}%2$cint main() {%2$c%5$cif (INDEX <= 1) return 0;%2$c%5$cchar buff[50] = {0};%2$c%5$csprintf(buff, %3$cSully_%%d.c%3$c, INDEX -1);%2$c%5$cFILE *f = fopen(buff, %3$cw%3$c);%2$c%5$cif (f == NULL) return 0;%2$c%5$cchar *a = %3$c%s%3$c;copyexec(f, a);%2$c}%2$c";copyexec(f, a);
}
