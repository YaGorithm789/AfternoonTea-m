let n = Int(readLine()!)!
let e = Int(readLine()!)!
var adj = Array(repeating: [Int](), count: n + 1)
var queue = [1]
var visited = Array(repeating: false, count: n + 1)
var result = 0
visited[1] = true

for _ in 0..<e {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        let u = uv[0], v = uv[1]
    
        adj[u].append(v)
        adj[v].append(u)
}

while queue.isEmpty == false {
    let cur = queue.removeFirst()
    
    for i in adj[cur] {
        if visited[i] { continue }
        
        queue.append(i)
        visited[i] = true
        result += 1
    }
}

print(result)
