let ve = readLine()!.split(separator: " ").map { Int($0)! }
let v = ve[0], e = ve[1]
var edges = [(cost: Int, u: Int, v: Int)]()
var p = Array(repeating: -1, count: v + 1)
var count = 0
var result = 0

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let a = abc[0], b = abc[1], c = abc[2]
    
    edges.append((c, a, b))
}

edges.sort { $0 < $1 }

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

for i in 0..<e {
    if isDiffGroup(u: edges[i].u, v: edges[i].v) == false { continue }
    
    count += 1
    result += edges[i].cost
    
    if count == v - 1 { break }
}

print(result)
