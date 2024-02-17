let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 2)
dp[1] = 1
dp[2] = 3

for i in stride(from: 3, through: n, by: 1) {
    dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 2]) % 10007
}

print(dp[n])
