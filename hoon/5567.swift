let n = Int(readLine()!)!
let m = Int(readLine()!)!
var adj = Array(repeating: [Int](), count: n + 1)
var visited = Array(repeating: -1, count: n + 1)
var result = 0

for _ in 0..<m {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        let u = uv[0], v = uv[1]

        adj[u].append(v)
        adj[v].append(u)
}

func bfs() {
    var queue = [1]
    visited[1] = 0
    
    while queue.isEmpty == false {
        let cur = queue.removeFirst()
        
        for i in adj[cur] {
            if visited[i] != -1 { continue }
            
            queue.append(i)
            visited[i] = visited[cur] + 1
        }
    }
}

bfs()
print(visited.filter { $0 > 0 && $0 < 3 }.count)
