let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n)
dp[0] = seq[0]

for i in 1..<n {
    dp[i] = max(dp[i - 1] + seq[i], seq[i])
}

print(dp.max()!)
