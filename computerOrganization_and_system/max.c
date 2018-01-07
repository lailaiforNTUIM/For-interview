#include<linux/kernel.h>
#include<linux/linkage.h>
asmlinkage long sys_max( long a, long b, long c){
	 long ans=a;
	if(b>ans) ans=b;
	if(c>ans) ans=c;
		return ans;
	//其實應該要除錯,就是ans如果是-1~-4095,都會回傳-1,因為都會被視為error.
	//可是我們不知道怎麼改哈哈哈哈. 本來想說用print "-"+把ans改為正的,
	//可是這樣就不能return value了
}
