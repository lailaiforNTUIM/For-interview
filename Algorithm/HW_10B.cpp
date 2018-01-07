#include<iostream>
#include<queue>
#include<vector>
#include<list>
#include<algorithm> 
#define inf 2147483647
#define N 5002
using namespace std;
typedef pair<int,int>ipair;
long long c[N],pre[N];
long long dp[N][N];
class graph{
	private:
		int vertice;
		list< pair < int,int > >adj[N];
		list<pair<int ,int >>reverseadj[N];
	public:
		vector<int>dist;
		vector<int>reversedist;
		graph(int v){
			vertice=v;
		}
	
		void addedge(int u,int v,int w){
			adj[u].push_back(make_pair(v,w));
		}
		void addreverse(int u,int v,int w){
			reverseadj[u].push_back(make_pair(v,w));
		}
		void shortpath(int src){
			priority_queue<ipair,vector<ipair>,greater<ipair> >pq;
			this->dist=vector<int>(vertice,inf);
			pq.push(make_pair(src,0));
			dist[src]=0;
			while(!pq.empty()){
				int u=pq.top().first;
				pq.pop();
				list< pair<int, int> >::iterator i;
				for(i=adj[u].begin();i!=adj[u].end();*i++){
					int v=(*i).first;
					int weight=(*i).second;
					if(dist[v]>dist[u]+weight){
						dist[v]=dist[u]+weight;
						pq.push(make_pair(v,dist[v]));
					}
				}
			}
		}
		void reverseshort(int src){
			priority_queue<ipair,vector<ipair>,greater<ipair> >pq;
			this->reversedist = vector<int>(vertice,inf);
			pq.push(make_pair(src,0));
			reversedist[src]=0;
			while(!pq.empty()){
				int u=pq.top().first;
				pq.pop();
				list< pair<int, int> >::iterator i;
				for(i=reverseadj[u].begin();i!=reverseadj[u].end();*i++){
					int v=(*i).first;
					int weight=(*i).second;
					if(reversedist[v]>reversedist[u]+weight){
						reversedist[v]=reversedist[u]+weight;
						pq.push(make_pair(v,reversedist[v]));
					}
				
				}
			}
	//			for(int i=1;i<=vertice;i++){
	//			cout<<"vertice"<<i<<" "<<reversedist[i]<<endl;
	//			}                      //看總部到分部 
			

		}
		int getv(){
			return vertice;
		}
	};
int main(){
//	freopen(argv[1],"r",stdin);        //重讀檔轉成一般cin 
	int n,b,s,r;
	cin>>n>>b>>s>>r;
	graph g(b+1);                      //畫路線圖 
	int u,v,weight;
	for(int i=0;i<r;i++){
		cin>>u>>v>>weight;
		g.addedge(u,v,weight);		    //連上邊	
		g.addreverse(v,u,weight);		//連上邊 
	}
	g.shortpath(b+1);					// 總部到各個分行的最短路徑 
	g.reverseshort(b+1);				//各個分行到總部的最短路徑 
	pre[0]=0;	
	for(int i=1;i<=b;i++){
		c[i]=g.dist[i]+g.reversedist[i];    //把每個分行 到總部+回總部的距離存起來 
	}
	sort(c+1,c+b+1);               
	for(int i=1;i<=b;i++){
		pre[i]=pre[i-1]+c[i];
	}                                   // 這部是算前綴和,這樣能O(1)讀1~n的路徑合 
	//接下來要minimize sum {c in 1..s組(size(組c-1)*sum(屬於組c的c[i]))} 

	for(int i=0;i<N;i++){
		for(int j=0;j<N;j++){
			dp[i][j]=inf;
		}
	}
	for(int i=0;i<N;i++){
		dp[0][i]=0;
	}


	for ( int i=1; i<=b; i++ ) {
		for ( int j=1; j<=s; j++ ) {
			int reduce=min(b/j+1,i);                       //這個REDUCE 是因為分越多組會越短,所以會把組分完,
															//這個手腳讓這段DP變成O(B^2LOGS) 
			for ( int k=1; k<=reduce; k++ ) {
				dp[i][j]=min(dp[i][j],dp[i-k][j-1]+(k-1)*(pre[i]-pre[i-k]));    //看是要拆開,還是維持原樣 
			}
		}
	}
	cout<<dp[b][s];
	
	return 0;
} 
