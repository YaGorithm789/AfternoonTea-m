let t = Int(readLine()!)!
var dp = Array(repeating: 1, count: 100)

for i in 3..<100 {
    dp[i] = dp[i - 2] + dp[i - 3]
}

for _ in 1...t {
    let n = Int(readLine()!)!
    
    print(dp[n - 1])
}
