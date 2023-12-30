let t = Int(readLine()!)!
let directions = [(-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1)]

for _ in 1...t {
    let l = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let dest = readLine()!.split(separator: " ").map { Int($0)! }
    var board = Array(repeating: Array(repeating: -1, count: l), count: l)
    var queue = [(start[0], start[1])]
    board[start[0]][start[1]] = 0
    
    while queue.isEmpty == false {
        if board[dest[0]][dest[1]] != -1 {
            print(board[dest[0]][dest[1]])
            break
        }
        
        let (x, y) = queue.removeFirst()
        
        for (dx, dy) in directions {
            guard 0..<l ~= x + dx,
                  0..<l ~= y + dy,
                  board[x + dx][y + dy] == -1
            else { continue }
            
            queue.append((x + dx, y + dy))
            board[x + dx][y + dy] = board[x][y] + 1
        }
    }
}
