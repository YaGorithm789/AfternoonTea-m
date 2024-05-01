let nrq = readLine()!.split(separator: " ").map { Int($0)! }
let n = nrq[0], r = nrq[1], q = nrq[2]
var adj = Array(repeating: [Int](), count: n + 1)

for _ in 1..<n {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0], v = uv[1]
    adj[u].append(v)
    adj[v].append(u)
}

var dp = Array(repeating: 0, count: n + 1)
var visited = Array(repeating: false, count: n + 1)

func dfs(cur: Int) {
    var count = 1
    visited[cur] = true
    
    for next in adj[cur] {
        if visited[next] { continue }
        
        dfs(cur: next)
        count += dp[next]
    }
    
    dp[cur] = count
    
    return
}

dfs(cur: r)

for _ in 0..<q {
    let u = Int(readLine()!)!
    print(dp[u])
}
