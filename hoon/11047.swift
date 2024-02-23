let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
var k = nk[1]
var coin = [Int]()
var answer = 0

for _ in 0..<n {
    coin.append(Int(readLine()!)!)
}

for i in coin.reversed() {
    answer += k / i
    k %= i
}

print(answer)
