let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nk[0]
let k = nk[1]
var dp = Array(repeating: 10001, count: 10001)
var coin = [Int]()
dp[0] = 0

for i in 0..<n {
    coin.append(Int(String(readLine()!))!)
    
    for j in stride(from: coin[i], through: k, by: 1) {
        dp[j] = min(dp[j], dp[j - coin[i]] + 1)
    }
}

if dp[k] == 10001 {
    print(-1)
} else {
    print(dp[k])
}
