#include <stdio.h>
int main() {
a = 0;

int orig = 0xD0D0;
int insert = 0x000B;
int a = orig ^ (insert << 4);
printf("\n%x\n",a);\n\nreturn 0;\n}\n
