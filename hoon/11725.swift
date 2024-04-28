let n = Int(readLine()!)!
var adj = Array(repeating: [Int](), count: n + 1)
var parent = Array(repeating: 0, count: n + 1)

for _ in 0..<n - 1 {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0], v = uv[1]
    
    adj[u].append(v)
    adj[v].append(u)
}

func dfs(vertex: Int) {
    for i in adj[vertex] {
        if parent[vertex] == i { continue }
        
        parent[i] = vertex
        dfs(vertex: i)
    }
}

dfs(vertex: 1)

for i in 2...n {
    print(parent[i])
}
