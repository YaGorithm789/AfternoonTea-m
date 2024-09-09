let n = Int(String(readLine()!))!
var s = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: false, count: n)
var team1 = 0
var team2 = 0
var minResult = 99999

for i in 0..<n {
    s[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func dfs(depth: Int, start: Int) {
    if depth == n / 2 {
        team1 = 0
        team2 = 0
        
        for i in 0..<n {
            for j in 0..<n {
                if !visited[i] && !visited[j]{
                    team2 += s[i][j]
                }
                
                if visited[i] && visited[j] {
                    team1 += s[i][j]
                }
            }
        }
        
        minResult = min(minResult, abs(team1 - team2))
        
        return
    }
    
    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth: depth + 1, start: i)
            visited[i] = false
        }
    }
}

dfs(depth: 0, start: 0)
print(minResult)
