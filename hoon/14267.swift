let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let parent = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: 0, count: n)
var adj = Array(repeating: [Int](), count: n + 1)

for i in 0..<n {
    if parent[i] == -1 { continue }
    
    adj[i + 1].append(parent[i])
    adj[parent[i]].append(i + 1)
}

for _ in 0..<m {
    let iv = readLine()!.split(separator: " ").map { Int($0)! }
    let i = iv[0], v = iv[1]
    
    result[i - 1] += v
}

func dfs(cur: Int) {
    for next in adj[cur] where next != parent[cur - 1] {
        result[next - 1] += result[cur - 1]
        dfs(cur: next)
    }
}

dfs(cur: 1)

print(result.map(String.init).joined(separator: " "))
