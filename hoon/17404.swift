let N = Int(readLine()!)!
var arr = [[0]]
let INF = 100000000
var ans = INF

for _ in 1...N {
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))!} )
}

for i in 0...2 {
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)
    
    for j in 0..<3 {
        if i == j {
            dp[1][j] = arr[1][j]
        } else {
            dp[1][j] = INF
        }
    }
    
    for j in 2...N {
        dp[j][0] = arr[j][0] + min(dp[j - 1][1], dp[j - 1][2])
        dp[j][1] = arr[j][1] + min(dp[j - 1][0], dp[j - 1][2])
        dp[j][2] = arr[j][2] + min(dp[j - 1][0], dp[j - 1][1])
    }
    
    for k in 0..<3 {
        if i != k {
            ans = min(ans, dp[N][k])
        }
    }
}

print(ans)
