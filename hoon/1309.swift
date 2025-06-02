let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)
dp[0] = 1
dp[1] = 3

for i in 2..<n + 1 {
    dp[i] = ((2 * dp[i - 1]) + dp[i - 2]) % 9901
}

print(dp[n])
