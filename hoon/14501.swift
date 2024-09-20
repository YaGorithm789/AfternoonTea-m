let n = Int(readLine()!)!
var arr = [[0, 0]]
var dp = Array(repeating: 0, count: 100)

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for i in 1..<n + 1 {
    if dp[i] > dp[i + 1] {
        dp[i + 1] = dp[i]
    }

    if i + arr[i][0] > n + 1 {
        continue
    }

    dp[i + arr[i][0]] = max(arr[i][1] + dp[i], dp[i + arr[i][0]])
}

print(dp.max()!)
