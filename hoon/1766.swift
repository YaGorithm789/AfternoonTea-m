func solution() -> String {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var adj = Array(repeating: [Int](), count: n + 1)
    var deg = Array(repeating: 0, count: n + 1)
    var stack = [Int]()
    var result = [String]()
    
    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let a = ab[0], b = ab[1]
        
        deg[b] += 1
        adj[a].append(b)
    }
    
    for i in stride(from: n, through: 1, by: -1) where deg[i] == 0 {
        stack.append(i)
    }
    
    while let cur = stack.popLast() {
        result.append(String(cur))
        
        for next in adj[cur] {
            deg[next] -= 1
            
            if deg[next] == 0 {
                stack.append(next)
            }
        }
        
        stack.sort(by: >)
    }
    
    return result.joined(separator: " ")
}

print(solution())
