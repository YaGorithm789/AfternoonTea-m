let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var board = [[Substring]]()
var queue = [(Int, Int)]()
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var draw = 0
var area = 0

for _ in 1...n {
    let array = readLine()!.split(separator: " ")
    board.append(array)
}

for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == "0" { continue }
        
        queue.append((i, j))
        draw += 1
        var temp = 0
        
        while let (a, b) = queue.popLast() {
            if board[a][b] == "0" { continue }
            
            board[a][b] = "0"
            temp += 1
            
            for (x, y) in zip(dx, dy) {
                if a + x < 0 || a + x >= n || b + y < 0 || b + y >= m { continue }
                if board[a + x][b + y] == "0" { continue }
                
                queue.append((a + x, b + y))
            }
        }
        
        area = max(area, temp)
    }
}

print("\(draw)\n\(area)")
