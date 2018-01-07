#include<iostream>
#include<fstream>
#include<stdlib.h>
#include<string>
using namespace std;



int main(){
	int a=rand()%100000;
	int	b=rand()%100000;
	ofstream myfile;
	string name;
	string def;
	string as;
	string bs;
	myfile.open("word.txt");
	for(int i=0;i<100000;i++){
		a=rand()%1000000;
		b=rand()%1000000;
		string ast=to_string(a);
		string bst=to_string(b);
		name=ast+"cool";
		def=bst+"nice";
		myfile<<name<<" "<<def<<endl;
	}
	myfile.close();
} 
