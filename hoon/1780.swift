let n = Int(readLine()!)!
var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var paperCount = [0, 0, 0]

func dfs(y: Int, x: Int, n: Int) {
    var count = [0, 0, 0]
    
    for y in y..<y + n {
        for x in x..<x + n {
            if board[y][x] == -1 {
                count[0] += 1
            } else if board[y][x] == 0 {
                count[1] += 1
            } else {
                count[2] += 1
            }
        }
    }
  
    for i in 0..<3 {
        if count[i] == n * n {
            paperCount[i] += 1
            return
        }
    }
    
    dfs(y: y, x: x, n: n / 3)
    dfs(y: y, x: x + n / 3, n: n / 3)
    dfs(y: y, x: x + n / 3 * 2, n: n / 3)
    dfs(y: y + n / 3, x: x, n: n / 3)
    dfs(y: y + n / 3, x: x + n / 3, n: n / 3)
    dfs(y: y + n / 3, x: x + n / 3 * 2, n: n / 3)
    dfs(y: y + n / 3 * 2, x: x, n: n / 3)
    dfs(y: y + n / 3 * 2, x: x + n / 3, n: n / 3)
    dfs(y: y + n / 3 * 2, x: x + n / 3 * 2, n: n / 3)
}

dfs(y: 0, x: 0, n: n)
paperCount.forEach { print($0) }
