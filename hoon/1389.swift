let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var adj = Array(repeating: [Int](), count: n + 1)
var result = [Int]()

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0], v = uv[1]
    adj[u].append(v)
    adj[v].append(u)
}

func bfs(vertex: Int) -> Int {
    var queue = [vertex]
    var index = 0
    var visited = Array(repeating: -1, count: n + 1)
    visited[0] = 0
    visited[vertex] = 0
    
    while queue.count > index {
        let cur = queue[index]
        
        for i in adj[cur] {
            if visited[i] != -1 { continue }
            
            queue.append(i)
            visited[i] = visited[cur] + 1
        }
        
        index += 1
    }
    
    return visited.reduce(0, +)
}

for i in 1...n {
    let score = bfs(vertex: i)
    result.append(score)
}

print(result.firstIndex(of: result.min()!)! + 1)
