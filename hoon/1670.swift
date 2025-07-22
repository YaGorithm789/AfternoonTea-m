let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)
dp[0] = 1
dp[2] = 1

if n > 2 {
    for i in stride(from: 4, through: n, by: 2) {
        for j in stride(from: 0, through: i - 2, by: 2) {
            dp[i] = (dp[i] + (dp[j] * dp[i - 2 - j])) % 987654321
        }
    }
}

print(dp[n])
