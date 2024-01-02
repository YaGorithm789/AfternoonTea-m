let n = Int(readLine()!)!
var board = [[Character]]()
var stack = [(Int, Int)]()
let directions = [(-1, 0), (0, -1), (1, 0), (0, 1)]
var witdh = [Int]()

for _ in 1...n {
    let input = Array(readLine()!)
    board.append(input)
}

for i in 0..<n {
    for j in 0..<n {
        guard board[i][j] == "1" else { continue }

        stack.append((i, j))
        board[i][j] = "0"
        var tmp = 0

        while let (a, b) = stack.popLast() {
            tmp += 1

            for (da, db) in directions {
                guard 0..<n ~= a + da,
                      0..<n ~= b + db,
                      board[a + da][b + db] == "1"
                else { continue }

                stack.append((a + da, b + db))
                board[a + da][b + db] = "0"
            }
        }

        witdh.append(tmp)
    }
}

print(witdh.count)
witdh.sorted().forEach { print($0) }
