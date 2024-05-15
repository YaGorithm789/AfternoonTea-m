func solution() {
    let n = Int(readLine()!)!
    var edges = [(cost: Int, u: Int, v: Int)]()
    var planets = [(number: Int, x: Int, y: Int, z: Int)]()
    var p = Array(repeating: -1, count: n)
    var count = 0
    var result = 0
    
    for i in 0..<n {
        let xyz = readLine()!.split(separator: " ").map { Int($0)! }
        
        planets.append((i, xyz[0], xyz[1], xyz[2]))
    }
    
    planets.sort { $0.x < $1.x }
    
    for i in 0..<n - 1 {
        let cost = abs(planets[i].x - planets[i + 1].x)
        
        edges.append((cost, planets[i].number, planets[i + 1].number))
    }
    
    planets.sort { $0.y < $1.y }
    
    for i in 0..<n - 1 {
        let cost = abs(planets[i].y - planets[i + 1].y)
                   
        edges.append((cost, planets[i].number, planets[i + 1].number))
    }
    
    planets.sort { $0.z < $1.z }
    
    for i in 0..<n - 1 {
        let cost = abs(planets[i].z - planets[i + 1].z)
        
        edges.append((cost, planets[i].number, planets[i + 1].number))
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
        
        if u < v {
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
        
        if count == n - 1 { break }
    }
    
    print(result)
}

solution()
