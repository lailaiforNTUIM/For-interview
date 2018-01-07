#include<stack>
#include<iostream>
#include<string>
using namespace std;

int precedence(char op){
    if(op=='(')
        return -1;
    else if(op=='+'||op=='-')
        return 0;
    else if(op=='*'||op=='/'||op=='%')
        return 1;
    else if(op=='_')
        return 2;
}

bool isNumber(char x){
    if(x<='9'&&x>='0')
        return 1;
    else
        return 0;
}

string toPostfix(string infix){
    string postfix;
    stack <char> st;
    for(int i = 0; i < infix.length(); i++){
        if(isNumber(infix[i])){
        	postfix+=infix[i];
			if(isNumber(infix[i-1])&&i-1>=0){
				postfix+='T';
				continue;
			}     
    	}
        else if(infix[i] == '(')
            st.push(infix[i]);
        else if(infix[i] == ')'){
            while(st.top() != '('){
                postfix += st.top();
                st.pop();
            }
            st.pop();
        }
        else if(infix[i] == '-' && (i==0 || !isNumber(infix[i-1])) && infix[i-1]!=')')
            st.push('_');
        else{
            while(!st.empty() && precedence(infix[i]) <= precedence(st.top())){
                postfix += st.top();
                st.pop();
            }
            st.push(infix[i]);
        }
    }
    while(!st.empty()){
        postfix += st.top();
        st.pop();
    }
    return postfix;
}


int myCalculator(string input){
	int nooverflow=0;
	
	for(int i=0;i< input.length() ;i++){
		
	}
    string postfix = toPostfix(input);
    stack <int> st;
    for(int i = 0; i < postfix.length(); i++){
        if(isNumber(postfix[i])){
            st.push(postfix[i]-'0');
            continue;
        }
        if(postfix[i] == '_'){
            int a = st.top(); st.pop();
            a *= -1;
            st.push(a);
            continue;
        }
        
		
        int b = st.top(); st.pop();
        int a = st.top(); st.pop();
        if(postfix[i]=='T'){
        	st.push(a*10+b);
        	if(a>=0&&b>=0){
        		if(st.top()<0){
        	 		nooverflow=1;
				}
			}
			else if(a<=0&&b<=0){
			 	if(st.top()>0){
			 		nooverflow=-1;
				}
			} 
		}
        
        else if(postfix[i] == '+'){
        	 st.push(a+b);
        	 if(a>=0&&b>=0){
        	 	if(st.top()<0){
        	 		nooverflow=1;
				 }
			 }
			 else if(a<=0&&b<=0){
			 	if(st.top()>0){
			 		nooverflow=-1;
				 }
			 } 
		}
        else if(postfix[i] == '-'){
        	st.push(a-b);
        	if(a<=0&&b>=0){
        		if(st.top()>0){
        			nooverflow=-1;
				} 
			} 
		}
           
        else if(postfix[i] == '*'){
        	st.push(a*b);
			if(a>0&&b>0){
        	 	if(st.top()<0){
        	 		nooverflow=1;
				}
			}
			 else if (a<0&&b<0){
			 	if(st.top()>0){
			 		nooverflow=-1;
				}
			} 	
		}
           
        else if(postfix[i] == '/'){
        	st.push(a/b);
        	if(a>0&&b>0){
        	 	if(st.top()<0){
        	 		nooverflow=1;
				}
			}
			else if(a<0&&b<0){
			 	if(st.top()>0){
			 		nooverflow=-1;
				}
			}
		}
           
        else if(postfix[i] == '%'){
				st.push(a%b);
				if(a>0&&b>0){
        			if(st.top()<0){
        	 			nooverflow=1;
				}
			}
			 	else if (a<0&&b<0){
			 		if(st.top()>0){
			 			nooverflow=-1;
				}
			}        	
		}
    }
    if(nooverflow==0)
    	return st.top();
    else if (nooverflow==-1){
    	int answer=-2147483647;
    	return answer;
	}
	else if (nooverflow==1){
		int answer=2147483647;
		return answer;
	} 
    
    
}


int main(){
    while(1){
        string input;
        cin>>input;
        if(input=="stop")
            break;
        else{
        	int ans=0;
        	ans = myCalculator(input);
        	if(ans== -2147483647){
        		cout<<"underflow";
			}
			else if(ans==2147483647) 
				cout<<" overflow";
			else 
				cout<<ans<<endl;
		}
        
    }

}

