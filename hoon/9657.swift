let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)
dp[1] = 0
dp[2] = 1
dp[3] = 0
dp[4] = 0

for i in 5...1000 {
    dp[i] = min(dp[i - 1] ^ 1, dp[i - 3] ^ 1, dp[i - 4] ^ 1)
}

print(dp[N] == 0 ? "SK" : "CY")
