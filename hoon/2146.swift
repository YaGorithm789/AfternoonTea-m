let input = Int(readLine()!)!
var result = -1
var map: [[Int]] = []

for _ in 0..<input {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(input)
}

let dx: [Int] = [1, -1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]

func bfs1(x: Int, y: Int, label: Int) {
    var queue: [(x: Int, y: Int)] = [(x, y)]
    var index = 0
    
    map[x][y] = label
    
    while index < queue.count {
        let first = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = first.x + dx[i]
            let ny = first.y + dy[i]
            
            if nx >= 0 && nx < input && ny >= 0 && ny < input {
                if map[nx][ny] == 1 {
                    map[nx][ny] = label
                    queue.append((nx, ny))
                }
            }
        }
    }
}

func bfs2(x: Int, y: Int) {
    var queue: [(x: Int, y: Int, count: Int)] = [(x, y, 0)]
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: input), count: input)
    var index = 0

    visited[x][y] = true
    
    while index < queue.count {
        let first = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = first.x + dx[i]
            let ny = first.y + dy[i]
            let nCount = first.count + 1
            
            if nx >= 0 && nx < input && ny >= 0 && ny < input {
                if map[nx][ny] != map[x][y] && !visited[nx][ny] {
                    if map[nx][ny] != 0 {
                        index = queue.count
                        result = result < 0 ? nCount : min(result, first.count)
                        break
                    }
                    
                    visited[nx][ny] = true
                    queue.append((nx, ny, nCount))
                }
            }
        }
    }
}

var label: Int = 10

for i in 0..<input {
    for j in 0..<input {
        if map[i][j] == 1 {
            bfs1(x: i, y: j, label: label)
            label += 1
        }
    }
}

for i in 0..<input {
    for j in 0..<input {
        if map[i][j] != 0 {
            bfs2(x: i, y: j)
        }
    }
}

print(result)
