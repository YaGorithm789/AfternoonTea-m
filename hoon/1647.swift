let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var edges = [(cost: Int, u: Int, v: Int)]()
var p = Array(repeating: -1, count: n + 1)
var count = 0
var result = 0
var remove = 0

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let a = abc[0], b = abc[1], c = abc[2]
    
    edges.append((c, a, b))
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

for edge in edges {
    if isDiffGroup(u: edge.u, v: edge.v) == false { continue }
    
    count += 1
    result += edge.cost
    remove = max(remove, edge.cost)
    
    if count == n - 1 { break }
}

print(result - remove)
