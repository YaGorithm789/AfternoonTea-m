let nm = readLine()!.split(separator: " ")
let n = Int(nm[0])!
let m = Int(nm[1])!
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var board = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var isCycle = false
var result = 0

func dfs(x: Int, y: Int) -> Int {
    if x < 0 || y < 0 || x >= n || y >= m || board[x][y] == -1 || isCycle { return 0 }
    
    var cal = -1
    
    if visited[x][y] == -1 {
        visited[x][y] = 0
        
        for i in 0..<4 {
            let r = dfs(x: x + board[x][y] * dx[i], y: y + board[x][y] * dy[i]) + 1
            if cal < r { cal = r }
        }
        
        visited[x][y] = cal
        
        return cal
    } else if visited[x][y] == 0 {
        isCycle = true
        
        return 0
    } else {
        return visited[x][y]
    }
}

for i in 0..<n {
    let s = readLine()!.map { Int(String($0)) ?? -1 }
    
    for j in 0..<m {
        board[i][j] = s[j]
    }
}

result = dfs(x: 0, y: 0)
result = isCycle ? -1 : result
print(result)
