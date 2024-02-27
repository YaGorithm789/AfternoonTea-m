let n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var answer = 0

for i in 0..<n {
    answer += p[i] * (n - i)
}

print(answer)
