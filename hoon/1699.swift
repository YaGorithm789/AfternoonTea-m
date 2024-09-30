let N = Int(readLine()!)!
var dp = Array(repeating: Int.max, count: N + 1)
dp[0] = 0

for i in 1...N {
    var j = 1
  
    while j * j <= i {
        dp[i] = min(dp[i], dp[i - j * j] + 1)
        j += 1
    }
}

print(dp[N])
