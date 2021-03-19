template <typename A,typename B>
struct Graph
{
    int n,m; unordered_map<A,int,custom_hash> mp; vector<bool> visit; 
    vector<vector<int>> graph; vector<vector<B>> cost; vector<B> dist;
    Graph(int x,int b) { n = x; m = b; graph.resize(x); }
    void reset_visit() { visit.resize(n,false); }
    void reset_dist() { dist.resize(n,999999999999); }
    void accept_nodes() { A x; for(int i=0;i<n;i++) { cin >> x; mp[x] = i; } }
    void accept() {A x,y; int nd = 0;// accepts the graph with any data type
        for(int i=0;i<m;i++) {cin >> x >> y; if(mp.find(x) == mp.end()) { mp[x] = nd++; }
            if(mp.find(y) == mp.end()) { mp[y] = nd++; } graph[mp[x]].push_back(mp[y]); }
    }
    void dfs(int d,int fnd) { visit[d] = true;
        for(int i=0;!visit[fnd]&&i<graph[d].size();i++) if(!visit[graph[d][i]]){dfs(graph[d][i]);}
    }
    int bfs(int start, int fnd) { queue<pair<int,int>> q; q.push(make_pair(start,0));
        while(!q.empty() && q.front().first != fnd) { pair<int,int> p = q.front(); q.pop();
            for(int i=0;i<graph[p.first].size();i++)q.push(make_pair(graph[p.first][i],p.second+1));
        } return q.front().second;
    }
    void transpose(int d, vector<vector<int>> &rev) {
        visit[d] = true;
        for(int i=0;i<graph[d].size();i++)
        {rev[graph[d][i]].push_back(d);if(!visit[graph[d][i]]){transpose(graph[d][i],rev);}}
    }
    void first_dfs(int i,stack<int> &s) { visit[i] = true;
        for(int j=0;j<graph[i].size();j++) if(!visit[graph[i][j]]) { first_dfs(graph[i][j],s); }
        s.push(i);
    }
    void second_dfs(int v,int ind,vector<vector<int>> &cc,vector<int> &scc) {
        cc[ind].push_back(v); scc[v] = ind; visit[v] = true;
        for(vector<int>::iterator i = graph[v].begin();i != graph[v].end();i++)
            if(!visit[*i]) second_dfs(*i,ind,cc,scc);
    }
    pair<vector<vector<int>>,vector<int>> kosaraju(){stack<int>s;reset_visit();reset_dist();
        for(int i=0;i<n;i++) if(!visit[i]) first_dfs(i,s);
        reset_visit();vector<vector<int>>rev(n);for(int i=0;i<n;i++)if(!visit[i])transpose(i,rev);
        vector<vector<int>> cc(n); vector<int> scc(n); int v,ind=0;
        while(!s.empty()){v=s.top();s.pop();if(!visit[v]){second_dfs(v,ind,cc,scc);ind++;}}
        reset_visit(); return make_pair(cc,scc);
        //after this operation scc maps a node to corresponding scc number
        //cc maps scc component to nodes
    }
    void dfsSCC(int d,vector<int> &scc,vector<vector<int>> &c) { visit[d] = true;
        for(int i=0;i<graph[d].size();i++)
        {   if(scc[d] != scc[graph[d][i]]) c[scc[d]].push_back(scc[graph[d][i]]);
            if(!visit[graph[d][i]]) dfsSCC(graph[d][i],scc,c);}
    }
    vector<vector<int>> getSCC()
    {
        pair<vector<vector<int>>,vector<int>> p = kosaraju(); vector<vector<int>> cc = p.first;
        vector<int> scc = p.second; reset_visit(); vector<vector<int>> connect(cc.size());
        for(int i=0;i<n;i++) if(!visit[i]) dfsSCC(i,scc,connect);
        for(int i=0;i<connect.size();i++) {
            vector<int> k = connect[i]; connect[i].clear(); unordered_map<int,bool> ch;
            for(int j=0;j<k.size();j++)
            { if(ch.find(k[j]) == ch.end()) { connect[i].push_back(k[j]); ch[k[j]] = true; } }
            ch.clear(); } return connect;
    }
};
