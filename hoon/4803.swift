var t = 1

while let input = readLine(), input != "0 0" {
    let nm = input.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var visited = Array(repeating: false, count: n + 1)
    var adj = Array(repeating: [Int](), count: n + 1)
    var count = 0
    visited[0] = true
    
    for _ in 0..<m {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        let u = uv[0], v = uv[1]
        adj[u].append(v)
        adj[v].append(u)
    }
    
    var nodes = 0
    var edges = 0
    
    func dfs(cur: Int) {
        if visited[cur] { return }
        
        visited[cur] = true
        nodes += 1
        
        for next in adj[cur] {
            edges += 1
            if visited[next] { continue }
            
            dfs(cur: next)
        }
        
        return
    }
    
    for i in 0..<n + 1 {
        if visited[i] == false {
            dfs(cur: i)
            count += nodes - (edges / 2) == 1 ? 1 : 0
            nodes = 0
            edges = 0
        }
    }
    
    if count > 1 {
        print("Case \(t): A forest of \(count) trees.")
    } else if count == 1 {
        print("Case \(t): There is one tree.")
    } else {
        print("Case \(t): No trees.")
    }
    
    t += 1
}
