let N = Int(readLine()!)!
let H = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
let P = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: 100)

for i in 1...N {
    let (h, p) = (H[i], P[i])
    
    for k in 0...99 {
        if h <= k {
            dp[k][i] = max(dp[k][i - 1], dp[k - h][i - 1] + p)
        } else {
            dp[k][i] = dp[k][i - 1]
        }
    }
}

print(dp[99][N])
