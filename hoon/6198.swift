let n = Int(readLine()!)!
var stack = [Int]()
var answer = 0

for _ in 0...n - 1 {
    let height = Int(readLine()!)!
    
    while let last = stack.last, last <= height {
        stack.removeLast()
        answer += stack.count
    }
    
    stack.append(height)
}

for _ in stack {
    let idx = stack.removeLast()
    answer += stack.count
}

print(answer)
