var dp = Array(repeating: 0, count: 1000001)
let n = Int(readLine()!)!

for i in stride(from: 2, through: n, by: 1) {
    dp[i] = dp[i - 1] + 1
    if i % 2 == 0 { dp[i] = min(dp[i], dp[i / 2] + 1) }
    if i % 3 == 0 { dp[i] = min(dp[i], dp[i / 3] + 1) }
}

print(dp[n])
