let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1], h = input[2]
var graph = [[[Int]]](repeating: [], count: h)

let dx = [1, 0, -1, 0, 0, 0]
let dy = [0, 1, 0, -1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]

for i in 0..<h {
    for _ in 0..<n {
        graph[i].append(readLine()!.split(separator: " ").map { Int($0)! })
    }
}

var queue: [(Int, Int, Int)] = []

for z in 0..<h {
    for y in 0..<n {
        for x in 0..<m {
            if graph[z][y][x] == 1 {
                queue.append((z, y, x))
            }
        }
    }
}

var index = 0

while queue.count > index {
    let z = queue[index].0
    let y = queue[index].1
    let x = queue[index].2
    
    for i in 0..<6 {
        let nz = z + dz[i]
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if 0..<m ~= nx && 0..<n ~= ny && 0..<h ~= nz && graph[nz][ny][nx] == 0 {
            graph[nz][ny][nx] = graph[z][y][x] + 1
            queue.append((nz, ny, nx))
        }
    }
    index += 1
}

print(graph.flatMap { $0 }.flatMap { $0 }.contains(0) ? -1 : graph.flatMap { $0 }.flatMap { $0 }.max()! - 1)
