let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
let b = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var sum = 0

for i in 0..<n {
    sum += a[i] * b[i]
}

print(sum)
