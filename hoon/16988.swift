let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let col = input[0]
let row = input[1]
var graph = [[Int]]()
var queue = [(Int, Int)]()
var rivalBadukQueue = [(Int, Int)]()
var visited = Array(repeating: Array(repeating: false, count: row), count: col)
var rivalBadukVisited = Array(repeating: Array(repeating: false, count: row), count: col)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var result = 0

for i in 0..<col {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
    
    for j in 0..<row {
        if graph[i][j] == 2 {
            rivalBadukQueue.append((i, j))
        }
    }
}

func makeBaduk(_ count: Int) {
    if count == 2 {
        var countSum = 0
        rivalBadukVisited = Array(repeating: Array(repeating: false, count: row), count: col)
        
        for (y, x) in rivalBadukQueue {
            if !rivalBadukVisited[y][x] {
                countSum += bfs(y, x)
            }
        }
        
        result = max(result, countSum)
    } else {
        for i in 0..<col {
            for j in 0..<row {
                if graph[i][j] == 0 && !visited[i][j] {
                    visited[i][j] = true
                    graph[i][j] = 1
                    makeBaduk(count + 1)
                    visited[i][j] = false
                    graph[i][j] = 0
                }
            }
        }
    }
}

var index = 0

func bfs(_ y: Int, _ x: Int) -> Int {
    rivalBadukVisited[y][x] = true
    queue.append((y, x))
    var count = 1
    var flag = true
    
    while queue.count > index {
        let (nowY, nowX) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = dx[i] + nowX
            let ny = dy[i] + nowY
            
            if 0..<row ~= nx && 0..<col ~= ny {
                if graph[ny][nx] == 2 && !rivalBadukVisited[ny][nx] {
                    rivalBadukVisited[ny][nx] = true
                    count += 1
                    queue.append((ny, nx))
                } else if graph[ny][nx] == 0 {
                    flag = false
                }
            }
        }
    }

    if flag {
        return count
    }
    
    return 0
}

makeBaduk(0)
print(result)
