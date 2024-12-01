let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
var queue = [(0, 0, 0)]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var miro = [[Int]]()
visited[0][0] = true

for _ in 0..<n {
    let input = Array(readLine()!).map { Int(String($0))! }
    miro.append(input)
}

while !queue.isEmpty {
    let poped = queue.removeFirst()
    
    if poped.0 == n - 1 && poped.1 == m - 1 {
        print(poped.2)
    }
    
    for direction in directions {
        let i = poped.0 + direction.0
        let j = poped.1 + direction.1
        let cost = poped.2
        
        if i >= 0 && i < n && j >= 0 && j < m {
            if !visited[i][j] {
                visited[i][j] = true
                
                if miro[i][j] == 0 {
                    queue.insert((i, j, cost), at: 0)
                } else {
                    queue.append((i, j, cost + 1))
                }
            }
        }
    }
}
