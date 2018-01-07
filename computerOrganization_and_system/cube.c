#include<linux/kernel.h>
#include<linux/linkage.h>
asmlinkage long sys_cube( long a){
	long ans= a*a*a;
	// if ans is between [-1,-4095], the systemcall will return -1 instead of ans
	return ans;

}
