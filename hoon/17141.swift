let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nm[0]
let m = nm[1]
var arr = [[Int]]()
var virusLocation = [(Int, Int)]()
var storeVirusLocation = [(Int, Int)]()
var printValue = Int.max

for i in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
    
    for j in 0..<n {
        if arr[i][j] == 2 {
            virusLocation.append((i, j))
        }
    }
}

var visitedDFS = Array(repeating: false, count: virusLocation.count)

func dfs(_ depth: Int, _ start: Int) {
    if depth == m {
        printValue = min(printValue, bfs(storeVirusLocation))
        return
    }
    
    for i in start..<virusLocation.count {
        if !visitedDFS[i] {
            visitedDFS[i] = true
            storeVirusLocation.append(virusLocation[i])
            dfs(depth + 1, i)
            visitedDFS[i] = false
            storeVirusLocation.removeLast()
        }
    }
}

func bfs(_ realVirusLocation: [(Int, Int)]) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var time = 0
    var queue = [((Int, Int), Int)]()

    for i in 0..<m {
        queue.append(((realVirusLocation[i].0, realVirusLocation[i].1), 0))
        visited[realVirusLocation[i].0][realVirusLocation[i].1] = true
    }

    var idx = 0
    
    while queue.count > idx {
        let pop = queue[idx]
        idx += 1
        let x = pop.0.0
        let y = pop.0.1
        time = pop.1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n || visited[nx][ny] { 
                continue
            }
            
            if arr[nx][ny] == 1 {
                visited[nx][ny] = true
                continue
            }

            queue.append(((nx, ny), pop.1 + 1))
            visited[nx][ny] = true
        }
    }
    
    if check(visited) {
        return time
    } else {
        return Int.max
    }
}

func check(_ visited: [[Bool]]) -> Bool {
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && arr[i][j] != 1 {
                return false
            }
        }
    }
    
    return true
}

dfs(0, 0)

if printValue == Int.max {
    print(-1)
} else {
    print(printValue)
}
