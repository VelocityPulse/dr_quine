#include<stdio.h>
/*
	comment
*/
void print(char *a){printf(a,10,34,a);}
int main(){
/*
	comment
*/
char*a="#include<stdio.h>/*%1$c%4$ccomment%1$c*/%cvoid print(char *a){printf(a,10,34,a,9);}%1$cint main(){/*%1$c%4$ccomment%1$c*/char*a=%c%s%2$c;print(a);}%1$c";print(a);}
