let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: 100001)

for i in 1...n {
    dp[i] = dp[i - 1] + arr[i - 1]
}

for _ in 1...m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (ij[0], ij[1])

    print(dp[j] - dp[i - 1])
}
