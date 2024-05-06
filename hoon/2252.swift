let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var adj = Array(repeating: [Int](), count: n + 1)
var deg = Array(repeating: 0, count: n + 1)
var queue = [Int]()
var result = ""

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0], b = ab[1]
    
    adj[a].append(b)
    deg[b] += 1
}

for i in 1...n {
    if deg[i] == 0 { queue.append(i) }
}

while queue.isEmpty == false {
    let cur = queue.removeFirst()
    result += "\(cur) "
    
    for next in adj[cur] {
        deg[next] -= 1
        
        if deg[next] == 0 { queue.append(next) }
    }
}

print(result)
