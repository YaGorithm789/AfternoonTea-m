var dp = Array(repeating: 0, count: 1000001)
var visited = Array(repeating: 0, count: 1000001)
let n = Int(readLine()!)!

for i in stride(from: 2, through: n, by: 1) {
    dp[i] = dp[i - 1] + 1
    visited[i] = i - 1
    
    if i % 2 == 0 && dp[i] > dp[i / 2] + 1 {
        dp[i] = dp[i / 2] + 1
        visited[i] = i / 2
    }
    if i % 3 == 0 && dp[i] > dp[i / 3] + 1 {
        dp[i] = dp[i / 3] + 1
        visited[i] = i / 3
    }
}

print(dp[n])

var cur = n
while true {
    print(cur, terminator: " ")
    if cur == 1 { break }
    cur = visited[cur]
}
