let step = Int(readLine()!)!
var stairs = Array(repeating: 0, count: step + 3)
var dp = Array(repeating: Array(repeating: 0, count: 3), count: step + 3)

for i in stride(from: 1, through: step, by: 1) {
    stairs[i] = Int(readLine()!)!
}

dp[1][1] = stairs[1]
dp[1][2] = 0
dp[2][1] = stairs[2]
dp[2][2] = stairs[1] + stairs[2]

for i in stride(from: 3, through: step, by: 1) {
    dp[i][1] = max(dp[i - 2][1], dp[i - 2][2]) + stairs[i]
    dp[i][2] = dp[i - 1][1] + stairs[i]
}

print(max(dp[step][1], dp[step][2]))
