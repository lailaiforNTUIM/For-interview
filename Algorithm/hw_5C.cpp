#include<iostream>
#include<cstdio> 
#include<algorithm>
using namespace std;
class node{
	private:
		int value;
		node* leftchild;
		node* rightchild;
		
	public:
		node(){
			value=0;
			leftchild=nullptr;
			rightchild=nullptr;
		}
		node(int n){
			value=n;
			leftchild=nullptr;
			rightchild=nullptr;
		}
		void setright(node* rightchild){
			this->rightchild = rightchild;
		}
		void setleft(node* leftchild){
			this->leftchild = leftchild;
		}
		void setvalue(int value){
			this->value=value;
		}
		int getvalue(){
			return value;		
		}
		node* getright(){
			return rightchild;
		}
		node* getleft(){
			return leftchild;
		}
		
};
int count(int value ,node* root ){
	if(value == root->getvalue()){
		return 0;
	}
	else if( value >root->getvalue()){
		return 2*count(value,root->getright())+2;
	}
	else if(value < root->getvalue()){
		return 2*count(value,root->getleft())+1;
	}
}
void construct(node* root, int temp[],int current){
		node* ptr= root;
		if(temp[current]>ptr->getvalue()){
			if(ptr->getright()==nullptr){
				node* right=new node(temp[current]);
				ptr->setright(right);
			}
			else{
				ptr=ptr->getright();
				construct(ptr,temp,current);
			}
		}
		else if(temp[current]<=ptr->getvalue()){
			if(ptr->getleft()==nullptr){
				node*left=new node(temp[current]);
				ptr->setleft(left);
			}
			else{
				ptr=ptr->getleft();
				construct(ptr,temp,current);
			}
		}
}




int main(int argc,char*argv[]){
	freopen(argv[1],"r",stdin);   //轉成cin 
	int ceiling,protype=0;
	cin>>ceiling>>protype;
	int **tree=new int*[ceiling];
	for(int i=0;i<ceiling;i++){
		tree[i]=new int [protype];
	}
	                                   //建立陣列 
	 
	for(int i=0;i<ceiling;i++){
		int *temp=new int[protype];
		int *tempout=new int[protype];
		cin>>temp[0];
		node *root=new node(temp[0]);//存數子
		tempout[0]=0; 
		for(int k=1;k<protype;k++){
			cin>>temp[k];
			construct(root,temp,k);   //BST 
			tempout[k]=count(temp[k],root); //給每個node 一個數 紀錄形狀 
		}
		sort(tempout,tempout+protype); //由小排到大 
		
		for(int k=0;k<protype;k++){
			tree[i][k]=tempout[k];
		}
	}
	
	int ans=1;
	for(int z=1;z<ceiling;z++){
		for(int k=0;k<z;k++){
			bool flag=0;
			for(int i=1;i<protype;i++){
				if(tree[z][i]!=tree[k][i]){
					flag=1;
				}
			}                                    //檢查有沒有重複過 
			if(!flag){         //有重複過 就扣掉 
				ans--;
				break;
			}	
		}
		ans++;
	}
	cout<<ans<<endl;
	for(int i=0;i<ceiling;i++){     //刪除陣列 
		delete []tree[i];
	}	
	delete [] tree;
	
	
	return 0;
} 
