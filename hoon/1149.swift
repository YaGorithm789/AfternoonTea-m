let n = Int(readLine()!)!
var r = Array(repeating: 0, count: n)
var g = Array(repeating: 0, count: n)
var b = Array(repeating: 0, count: n)
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n)

for i in 0..<n {
    let rgb = readLine()!.split(separator: " ").map { Int($0)! }
    
    r[i] = rgb[0]
    g[i] = rgb[1]
    b[i] = rgb[2]
}

dp[0][0] = r[0]
dp[0][1] = g[0]
dp[0][2] = b[0]

for i in 1..<n {
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + r[i]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + g[i]
    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + b[i]
}

print(min(dp[n - 1][0], dp[n - 1][1], dp[n - 1][2]))
