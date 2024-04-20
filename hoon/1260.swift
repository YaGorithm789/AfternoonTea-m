let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmv[0], m = nmv[1], v = nmv[2]
var adj = Array(repeating: [Int](), count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0], v = uv[1]
    
    adj[u].append(v)
    adj[v].append(u)
}

for i in 1...n {
    adj[i].sort()
}

var result = ""

func dfs(vertex: Int) {
    var visited = Array(repeating: false, count: n + 1)
    var stack = [Int]()
    stack.append(vertex)
    
    while let cur = stack.popLast() {
        if visited[cur] { continue }
        
        visited[cur] = true
        result += String(cur) + " "
        
        for i in stride(from: adj[cur].count - 1, through: 0, by: -1) {
            let v = adj[cur][i]
            
            if visited[v] { continue }
            
            stack.append(v)
        }
    }
}

func bfs(vertex: Int) {
    var visited = Array(repeating: false, count: n + 1)
    var queue = [Int]()
    queue.append(vertex)
    visited[vertex] = true
    
    while queue.isEmpty == false {
        let cur = queue.removeFirst()
        result += String(cur) + " "
        
        for i in adj[cur] {
            if visited[i] { continue }
            
            queue.append(i)
            visited[i] = true
        }
    }
}

dfs(vertex: v)
result += "\n"
bfs(vertex: v)
print(result)
