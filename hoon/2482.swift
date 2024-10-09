let N = Int(readLine()!)!
let K = Int(readLine()!)!
var start = 4
var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
(1...N).forEach{ dp[$0][1] = $0 }

for i in 2...N {
    if start <= N {
        for k in start...N {
            dp[k][i] = (dp[k - 1][i] + dp[k - 2][i - 1]) % 1000000003
        }
        
        start += 2
    }
}

print(dp[N][K])
