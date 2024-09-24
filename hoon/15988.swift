let t = Int(String(readLine()!))!
var arr = [Int]()
var dp: [Int] = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in stride(from: 4, through: 1000000, by: 1) {
    dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1000000009
}

for _ in 1...t {
    let a = Int(String(readLine()!))!
    print(dp[a])
}
