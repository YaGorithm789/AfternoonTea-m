let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var graph: [[Int]] = []
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func isValidCoord(y: Int, x: Int) -> Bool {
    return 0..<n ~= y && 0..<m ~= x
}

func getBridgeDirections(y: Int, x: Int) -> [Int] {
    var directions: [Int] = []
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
      
        if !isValidCoord(y: ny, x: nx) {
            continue
        }
      
        if graph[ny][nx] == 0 {
            directions.append(i)
        }
    }
  
    return directions
}

func numberingGrand(y: Int, x: Int, n: Int) {
    var queue = [(y, x)]
    var index = 0
    graph[y][x] = n
    visited[y][x] = true
    
    while queue.count > index {
        let y = queue[index].0
        let x = queue[index].1
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if isValidCoord(y: ny, x: nx) && !visited[ny][nx] && graph[ny][nx] == 1 {
                visited[ny][nx] = true
                graph[ny][nx] = n
                queue.append((ny, nx))
            }
        }
      
        index += 1
    }
 
}

var groundNumber = 0

for y in 0..<n {
    for x in 0..<m {
        if graph[y][x] == 1 && !visited[y][x] {
            groundNumber += 1
            numberingGrand(y: y, x: x, n: groundNumber)
        }
    }
}

var edges: [(Int, Int, Int)] = []

func makeBridge(y: Int, x: Int, groundNumber: Int, direction: Int, depth: Int) {
    var queue = [(y, x, direction, depth)]
    var index = 0
  
    while queue.count > index {
        let y = queue[index].0
        let x = queue[index].1
        let direction = queue[index].2
        let depth = queue[index].3
        
        if graph[y][x] == groundNumber && depth > 1 {
            break
        }
        
        if graph[y][x] > 0 && graph[y][x] != groundNumber {
            if depth > 2 {
                edges.append((groundNumber, graph[y][x], depth - 1))
            }
            break
        }
        
        let ny = y + dy[direction]
        let nx = x + dx[direction]
        
        if !isValidCoord(y: ny, x: nx) {
            break
        }
      
        queue.append((ny, nx, direction, depth + 1))
        index += 1
    }
}

for y in 0..<n {
    for x in 0..<m {
        if graph[y][x] > 0 {
            let direction = getBridgeDirections(y: y, x: x)
            direction.forEach {
                makeBridge(y: y, x: x, groundNumber: graph[y][x], direction: $0, depth: 0)
            }
        }
    }
}

edges.sort { $0.2 < $1.2 }

var parent = [Int](0...groundNumber)

func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    
    if a == b {
        return
    }
    
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

var answer = 0
var count = 0

for edge in edges {
    let a = find(edge.0)
    let b = find(edge.1)
    let cost = edge.2
    
    if a != b {
        union(a, b)
        
        answer += cost
        count += 1
    }
}

print(count != groundNumber - 1 ? -1 : answer)
