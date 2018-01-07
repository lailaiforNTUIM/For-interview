#include<iostream>
#include<string>
#include<fstream>
using namespace std;
static int totalnum=0;
int countkey(string s){
	int ans=0;
	for(int i=0;i<s.length();i++){
		ans+=s[i]-'a';
	}
	int key=ans%2048;
	return key;
	
	
}

template<class ItemType>
class Node
{
private:
  ItemType item;
  ItemType def;
  Node<ItemType>* next; 
public:
  Node();
  Node(const ItemType& anItem,const ItemType& andef);
  Node(const ItemType& anItem,const ItemType&andef, Node<ItemType>* nextNodePtr);
  void setItem(const ItemType& anItem,const ItemType& andef);
  void setNext(Node<ItemType>* nextNodePtr);
  ItemType getItem() const ;
  ItemType getdef()  const;
  Node<ItemType>* getNext() const ;
};
void add(string word,string def,string buffer,string preword,string predef,Node<string>*table[]){
	if(word.compare(buffer)!=0){ 
			int index=countkey(word); 
			Node<string>*addptr =  new Node<string>();
			addptr->setItem(word,def);
			if(table[index]==nullptr){
				table[index]=addptr;
			}
			else{
				addptr->setNext(table[index]);
				table[index]=addptr;
			}
			totalnum++;
			preword=word;
			predef=def;      
	}
		else{
			int index=countkey(preword);
			table[index]->setItem(preword,predef+def); 
			predef= table[index]->getdef();
		}
		
}
int main(){
	ifstream myfile("knownWords.txt");
	string word;
	string def;
	string preword;
	string predef;
	string buffer="-";
	Node<string>*table[2048]={nullptr};
	while(!myfile.eof()){
		myfile>>word;
		getline(myfile,def,'\n');
		add(word,def,buffer,preword,predef,table);  
	}

	myfile.close();
//	cout<<table[99]->getItem()<<" "<<table[99]->getdef();
	string find="find",neword="new",count="count",quit="quit";
	while(cin>>word){
		if(word.compare(find)==0){
			cin>>word;
			int index=countkey(word);
			bool itemfound=false;
			if(table[index]==nullptr){
				cout<<"it doesn't have the word";
				continue;
			}
			else if(word.compare(table[index]->getItem())==0){
				cout<<table[index]->getdef();
			}
			else{
				Node<string>*curptr=table[index]->getNext();
			
				while(!itemfound&&curptr!=nullptr){
					if(word.compare(curptr->getItem())==0){
						cout<<table[index]->getdef();
						itemfound=true;
					}
					else{
						curptr=curptr->getNext();
					}
				}
				if(!itemfound) cout<<"it doesn't have the word";
			}	
		}
		else if(word.compare(neword)==0){
			cin>>word;
			getline(cin,def,'\n');
			add(word,def,buffer,preword,predef,table);
			continue;
		}
		else if(word.compare(count)==0){
			cout<< totalnum;
			continue;
		}
		else if(word.compare(quit)==0){
			exit(1);
		}
		else{
			cout<<"wrong command";
		}
	}
	
	
	return 0;
	
	
} 
template<class ItemType>
Node<ItemType>::Node() : next(nullptr) {} 

template<class ItemType>
Node<ItemType>::Node(const ItemType& anItem,const ItemType&andef) 
  : item(anItem), def(andef),next(nullptr) {} 

template<class ItemType>
Node<ItemType>::Node(const ItemType& anItem,const ItemType&andef, Node<ItemType>* nextNodePtr)
  : item(anItem),def(andef), next(nextNodePtr) {}  
template<class ItemType>
void Node<ItemType>::setItem(const ItemType& anItem,const ItemType& andef)
{ item = anItem;
  def  = andef;} 

template<class ItemType>
void Node<ItemType>::setNext(Node<ItemType>* nextNodePtr)
{ next = nextNodePtr; } 

template<class ItemType>
ItemType Node<ItemType>::getItem() const
{ return item; } 
template<class ItemType>
ItemType Node<ItemType>::getdef() const
{ return def;}

template<class ItemType>
Node<ItemType>* Node<ItemType>::getNext() const
{ return next; }
