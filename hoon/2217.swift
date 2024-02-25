let n = Int(readLine()!)!
var rope = [Int]()
var answer = 0

for _ in 0..<n {
    rope.append(Int(readLine()!)!)
}

rope.sort(by: >)

for i in 0..<n {
    answer = max(answer, rope[i] * (i + 1))
}

print(answer)
