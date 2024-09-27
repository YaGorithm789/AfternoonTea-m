let T = Int(readLine()!)!

for _ in 0..<T {    
    let N = Int(readLine()!)!
    let numArray1 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let numArray2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = Array(repeating: Array(repeating: 0, count: N), count: 2)
    
    if N == 1 {
        print(max(numArray1[0], numArray2[0]))
    } else {
        dp[0][0] = numArray1[0]
        dp[1][0] = numArray2[0]
        dp[0][1] = dp[1][0] + numArray1[1]
        dp[1][1] = dp[0][0] + numArray2[1]
    
        for i in 2..<N {
            dp[0][i] = numArray1[i] + max(dp[1][i - 1], dp[1][i - 2])
            dp[1][i] = numArray2[i] + max(dp[0][i - 1], dp[0][i - 2])
        }
        
        print(max(dp[0][N - 1], dp[1][N - 1]))
    }
}
