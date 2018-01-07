#include<iostream>
using namespace std;
void heaprebuild(int index ,int array[], int  maxindex ){
	if(index*2+1<=maxindex){
		int leftindex=index*2+1;
	
		if(index*2+2<=maxindex){
			int rightindex=leftindex+1;
			if(array[leftindex]<array[rightindex]){
				leftindex=rightindex;
			}
		}
	
		if(array[index]<array[leftindex]){
			swap(array[index],array[leftindex]);
			heaprebuild(leftindex,array,maxindex);
		}
	}
	
}



void heapsort(int array[],int maxindex){
	for(int i=maxindex/2;i>=0;i--){
		heaprebuild(i,array,maxindex);
	}
	swap(array[0],array[maxindex]);
	maxindex--;
	while(maxindex>=0){
		heaprebuild(0,array,maxindex);
		swap(array[0],array[maxindex]);
		maxindex--;
	}
}

int main(){
	int array[]={7,5,12,4,6,8};
	heapsort(array,5);
	for(int i=0;i<6;i++){
		cout<<array[i]<<" ";
	}
	
	
	
	return 0;
} 
