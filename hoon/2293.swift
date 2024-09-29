import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nk[0]
let k = nk[1]
var coin = [Int]()

for _ in 0..<n {
    coin.append(Int(String(readLine()!))!)
}

var dp = Array(repeating: 0, count: k + 1)
dp[0] = 1

for i in 0..<n {
    for j in stride(from: coin[i], through: k, by: 1) {
        if dp[j] + dp[j - coin[i]] >= Int(pow(2.0, 31.0)) {
            dp[j] = 0
        } else {
            dp[j] += dp[j - coin[i]]
        }
    }
}

print(dp[k])
