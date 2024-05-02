let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var adj = Array(repeating: [(next: Int, distance: Int)](), count: n + 1)
var visited = Array(repeating: false, count: n + 1)
var result = 0

for _ in 1..<n {
    let uvd = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uvd[0], v = uvd[1], d = uvd[2]
    
    adj[u].append((v, d))
    adj[v].append((u, d))
}

func dfs(start: Int, end: Int, distance: Int) {
    if start == end {
        result = distance
        return
    }
    
    visited[start] = true
    
    for i in adj[start] {
        if visited[i.next] { continue }
        
        dfs(start: i.next, end: end, distance: distance + i.distance)
    }
}

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uv[0], v = uv[1]
    
    dfs(start: u, end: v, distance: 0)
    print(result)
    result = 0
    visited = Array(repeating: false, count: n + 1)
}
