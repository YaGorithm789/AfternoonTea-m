let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var graph: [[Character]] = []

for _ in 0..<n {
    graph.append(readLine()!.map { $0 })
}

var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: m), count: n), count: 2)

func isValidCoord(y: Int, x: Int) -> Bool {
    return 0..<n ~= y && 0..<m ~= x
}

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var queue = [(0, 0, 1, 0)]
var index = 0
var answer = -1

while queue.count > index {
    let y = queue[index].0
    let x = queue[index].1
    let d = queue[index].2
    let brokenCount = queue[index].3
    
    if y == n - 1 && x == m - 1 {
        answer = d
        break
    }
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if !isValidCoord(y: ny, x: nx) || visited[brokenCount][ny][nx] {
            continue
        }
        
        if graph[ny][nx] == "0" {
            visited[brokenCount][ny][nx] = true
            queue.append((ny, nx, d + 1, brokenCount))
        }
        
        if graph[ny][nx] == "1" && brokenCount == 0 {
            visited[brokenCount + 1][ny][nx] = true
            queue.append((ny, nx, d + 1, brokenCount + 1))
        }
        
    }
    index += 1
}

print(answer)
