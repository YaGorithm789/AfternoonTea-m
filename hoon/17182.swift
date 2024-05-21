let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
var d = [[Int]]()

for _ in 0..<n {
    d.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for k in 0..<n {
    for i in 0..<n where d[i][k] != .max {
        for j in 0..<n where d[k][j] != .max {
            d[i][j] = min(d[i][j], d[i][k] + d[k][j])
        }
    }
}

var visited = Array(repeating: false, count: n)
visited[k] = true
var result = Int.max

func dfs(cur: Int, node: Int, time: Int) {
    if time > result { return }
    
    if node == n {
        result = min(result, time)
        return
    }
        
    for next in 0..<n {
        if visited[next] { continue }
        
        visited[next] = true
        dfs(cur: next, node: node + 1, time: time + d[cur][next])
        visited[next] = false
    }
}

dfs(cur: k, node: 1, time: 0)
print(result)
