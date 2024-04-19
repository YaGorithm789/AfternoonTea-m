let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var adj = Array(repeating: [Int](), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0], v = uv[1]
    
    adj[u].append(v)
    adj[v].append(u)
}

var queue = [Int]()
var result = 0

func bfs(vertex: Int) {
    while queue.isEmpty == false {
        let cur = queue.removeFirst()
        
        for i in adj[cur] {
            if visited[i] { continue }
            
            queue.append(i)
            visited[i] = true
        }
    }

    result += 1
}

for i in 1...n {
    if visited[i] { continue }
    
    queue.append(i)
    visited[i] = true
    bfs(vertex: i)
}

print(result)
