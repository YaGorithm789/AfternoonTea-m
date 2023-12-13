let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var board = [[Character]]()
var visit = Array(repeating: Array(repeating: 1, count: m), count: n)
var queue = [(0, 0)]
let directions = [(-1, 0), (0, -1), (1, 0), (0, 1)]

for _ in 1...n {
    let array = Array(readLine()!)
    board.append(array)
}

while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    
    for (dx, dy) in directions {
        if !((0..<n) ~= x + dx && (0..<m) ~= y + dy) { continue }
        if board[x + dx][y + dy] == "0" { continue }
        if visit[x + dx][y + dy] > 1 { continue }
        
        visit[x + dx][y + dy] = visit[x][y] + 1
        queue.append((x + dx, y + dy))
    }
}

print(visit[n - 1][m - 1])
