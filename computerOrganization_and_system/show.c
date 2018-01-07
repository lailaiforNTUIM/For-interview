#include<linux/kernel.h>
#include<linux/linkage.h>

asmlinkage int sys_show(void){
	printk("hello,we are b04705016 and b04705010!\n");
	return 0;
	

}
