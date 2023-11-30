let n = Int(readLine()!)!
var queue = Array(1...n) + Array(repeating: 0, count: n - 1)
var tail = n
var head = 0

for _ in 1..<n {
    head += 1
    queue[tail] = queue[head]
    head += 1
    tail += 1
}

print(queue[tail - 1])
