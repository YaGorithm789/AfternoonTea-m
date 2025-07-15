let M = 1_000_000_000
let N = Int(readLine()!)!
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 1024), count: 10), count: (N + 1))

for i in 1..<10 {
    dp[1][i][1 << i] = 1
}

if N > 1 {
    for n in 2...N {
        for i in 0..<10 {
            for j in 0..<1024 {
                if i > 0 { dp[n][i][j|(1 << i)] += dp[n - 1][i - 1][j] }
                if i < 9 { dp[n][i][j|(1 << i)] += dp[n - 1][i + 1][j] }
                dp[n][i][j|(1 << i)] %= M
            }
        }
    }
}

print(dp[N].reduce(0) { ($0 + $1[1023]) % M })
