#include <iostream>
#include <fstream>
using namespace std;
int main() {
int a = 0;

int orig = 0x7070;
int insert = 0x0005;
a = orig ^ (insert << 4);
cout << hex << a;


return 0;
}
