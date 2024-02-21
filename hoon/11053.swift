let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if seq[i] > seq[j] {
            dp[i] = max(dp[j] + 1, dp[i])
        }
    }
}

print(dp.max()!)
