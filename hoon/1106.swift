let inp = readLine()!.split(separator: " ").map { Int(String($0))! }
let C = inp[0], N = inp[1]
var list = [(Int, Int)]()
var dp = Array(repeating: 0, count: 100001)

for _ in 0..<N {
    let q = readLine()!.split(separator: " ").map { Int(String($0))! }
    list.append((q[0], q[1]))
}

for i in 1...100000 {
    for k in list {
        if i >= k.0 {
            dp[i] = max(dp[i], dp[i - k.0] + k.1)
        }
    }
    
    if dp[i] >= C {
        print(i)
        break
    }
}
