let n = Int(readLine()!)!
var stack = [(Int, Int)]()
var answer = 0

for _ in 0..<n {
    var pair = (Int(readLine()!)!, 1)
    
    while let last = stack.last, last.0 <= pair.0 {
        answer += last.1
        
        if last.0 == pair.0 {
            pair.1 += last.1
        }
        
        stack.removeLast()
    }
    
    if !stack.isEmpty { answer += 1 }
    stack.append(pair)
}

print(answer)
