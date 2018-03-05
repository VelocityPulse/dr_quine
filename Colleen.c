#include<stdio.h>
/*
	comment1
*/
void print(char *a){printf(a,10,34,a,9);}
int main(){
/*
	comment2
*/
char*a="#include<stdio.h>%1$c/*%1$c%4$ccomment1%1$c*/%1$cvoid print(char *a){printf(a,10,34,a,9);}%1$cint main(){%1$c/*%1$c%4$ccomment2%1$c*/%1$cchar*a=%c%s%2$c;print(a);}%1$c";print(a);}
