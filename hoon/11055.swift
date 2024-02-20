let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n)

for i in 0..<n {
    dp[i] = seq[i]
    
    for j in 0..<i {
        if seq[i] > seq[j] {
            dp[i] = max(dp[j] + seq[i], dp[i])
        }
    }
}

print(dp.max()!)
