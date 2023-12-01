let t = Int(readLine()!)!
var answer = ""

Loop: for _ in 1...t {
    let p = readLine()!
    let n = Int(readLine()!)!
    var (head, tail) = (0, n - 1)
    var isReversed = false
    let deque = readLine()!.dropFirst().dropLast().split(separator: ",")
    
    for command in p {
        switch command {
        case "R":
            isReversed.toggle()
        default:
            if head > tail {
                answer += "error\n"
                continue Loop
            }
            
            isReversed ? (tail -= 1) : (head += 1)
        }
    }
    
    if head > tail {
        answer += "[]\n"
    } else if isReversed {
        answer += "[\(deque[head...tail].reversed().joined(separator: ","))]\n"
    } else {
        answer += "[\(deque[head...tail].joined(separator: ","))]\n"
    }
}

print(answer)
