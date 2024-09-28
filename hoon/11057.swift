let n = Int(String(readLine()!))!
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 1001)

for i in 0...9 {
    dp[1][i] = 1
}

for i in stride(from: 2, through: n, by: 1) {
    for j in 0...9 {
        for k in 0...j {
            dp[i][j] += dp[i - 1][k] % 10007
        }
    }
}

var sum = 0

for i in 0...9 {
    sum += dp[n][i]
}

print(sum % 10007)
