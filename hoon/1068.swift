let n = Int(readLine()!)!
var parent = readLine()!.split(separator: " ").map { Int($0)! }
var childs = Array(repeating: 0, count: n)
let remove = Int(readLine()!)!
let root = parent.firstIndex(of: -1)!
var dp = Array(repeating: 0, count: n)
var visited = Array(repeating: false, count: n)
var adj = Array(repeating: [Int](), count: n)

for i in 0..<n {
    if parent[i] == -1 {
        continue
    }
    
    adj[i].append(parent[i])
    adj[parent[i]].append(i)
}

func dfs(cur: Int) {
    var count = 0
    var child = 0
    visited[cur] = true
    
    if adj[cur].count == 1 && visited[adj[cur].first!] {
        count += 1
    }

    for next in adj[cur] {
        if visited[next] { continue }
        child += 1
        dfs(cur: next)
        count += dp[next]
    }

    childs[cur] = child
    dp[cur] = count
}

dfs(cur: root)

if root == remove {
    print(0)
} else {
    var count = childs[parent[remove]] == 1 ? 1 : 0
    
    print(dp[root] - dp[remove] + count)
}
