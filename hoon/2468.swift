let n = Int(readLine()!)!
let dir = [(-1, 0), (0, -1), (1, 0), (0, 1)]
var board = [[Int]]()
var areas = [1]
var low = 101
var high = 0

(1...n).forEach { _ in
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    low = min(low, input.min()!)
    high = max(high, input.max()!)
    board.append(input)
}

for rain in low..<high {
    var area = 0
    var stack = [(Int, Int)]()
    var visit = Array(repeating: Array(repeating: true, count: n), count:  n)
    
    for i in 0..<n {
        for j in 0..<n {
            guard board[i][j] > rain, visit[i][j] else { continue }
            
            area += 1
            stack.append((i, j))
            visit[i][j] = false
            
            while let (x, y) = stack.popLast() {
                for (dx, dy) in dir {
                    guard 0..<n ~= x + dx,
                          0..<n ~= y + dy,
                          board[x + dx][y + dy] > rain,
                          visit[x + dx][y + dy]
                    else { continue }
                    
                    stack.append((x + dx, y + dy))
                    visit[x + dx][y + dy] = false
                }
            }
        }
    }
    
    areas.append(area)
}

print(areas.max()!)
