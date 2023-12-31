let input = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n, k) = (input[0], input[1], input[2])
var board = Array(repeating: Array(repeating: 1, count: n), count: m)
var stack = [(Int, Int)]()
let directions = [(-1, 0), (0, -1), (1, 0), (0, 1)]
var count = 0
var witdh = [Int]()

for _ in 1...k {
    let points = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y, dx, dy) = (points[0], points[1], points[2], points[3])
    
    for i in y..<dy {
        for j in x..<dx {
            board[i][j] = 0
        }
    }
}
    
for i in 0..<m {
    for j in 0..<n {
        guard board[i][j] == 1 else { continue }
        
        count += 1
        stack.append((i, j))
        board[i][j] = 0
        var tmp = 0
        
        while let (a, b) = stack.popLast() {
            tmp += 1
            
            for (da, db) in directions {
                guard 0..<m ~= a + da,
                      0..<n ~= b + db,
                      board[a + da][b + db] == 1
                else { continue }
                
                stack.append((a + da, b + db))
                board[a + da][b + db] = 0
            }
        }
        
        witdh.append(tmp)
    }
}

print(count)
print(witdh.sorted().map(String.init).joined(separator: " "))
