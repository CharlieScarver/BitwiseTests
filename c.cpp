#include <iostream>
#include <fstream>
using namespace std;
int main() {
int a = 0;

int orig = 0xF0F0;
int insert = 0x000E;
a = orig | (insert << 4);
/*//test
int a = 0xf;
a = a << 31;*/cout << endl << "c: " << hex << a << endl;
ofstream ofs;
ofs.open ("answers.csv", ofstream::out | ofstream::app);
ofs << hex << a;
ofs << ",";
ofs.close();

return 0;
}
