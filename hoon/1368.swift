let n = Int(readLine()!)!
var edges = [(cost: Int, u: Int, v: Int)]()
var count = 0
var result = 0
var p = Array(repeating: -1, count: n + 2)

for i in 1...n {
    let cost = Int(readLine()!)!
    edges.append((cost, i, n + 1))
}

for i in 1...n {
    let cost = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 1...n {
        if i >= j { continue }
        
        edges.append((cost[j - 1], i, j))
    }
}

edges.sort(by: <)

func find(vertex: Int) -> Int {
    if p[vertex] < 0 { return vertex }

    p[vertex] = find(vertex: p[vertex])

    return p[vertex]
}

func isDiffGroup(u: Int, v: Int) -> Bool {
    let u = find(vertex: u)
    let v = find(vertex: v)

    if u == v { return false }
    if p[u] == p[v] { p[u] -= 1 }
    if p[u] < p[v] { p[v] = u }
    else { p[u] = v }

    return true
}

for i in 0..<edges.count {
    if isDiffGroup(u: edges[i].u, v: edges[i].v) == false { continue }
    
    count += 1
    result += edges[i].cost
    
    if count == n { break }
}

print(result)
