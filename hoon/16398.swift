let n = Int(readLine()!)!
var edges = [(cost: Int, u: Int, v: Int)]()
var p = Array(repeating: -1, count: n + 1)
var count = 0
var result = 0

for i in 0..<n {
    let cost = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0..<n {
        if i >= j { continue }
        
        edges.append((cost[j], i, j))
    }
}

func find(x: Int) -> Int {
    if p[x] < 0 { return x }
    
    p[x] = find(x: p[x])
    
    return p[x]
}

func isDiffGroup(u: Int, v: Int) -> Bool {
    let u = find(x: u)
    let v = find(x: v)
    
    if u == v { return false }
    
    if p[u] < p[v] {
        p[v] = u
    } else {
        p[u] = v
    }
    
    return true
}

edges.sort(by: <)

for i in 0..<edges.count {
    if isDiffGroup(u: edges[i].u, v: edges[i].v) == false { continue }
    
    count += 1
    result += edges[i].cost
    
    if count == n - 1 { break }
}

print(result)
