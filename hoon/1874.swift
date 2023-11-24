let n = Int(readLine()!)!
var stack = [0]
var answer = [String]()
var candi = [Int]()
var possible = true

for i in stride(from: n + 1, to: 0, by: -1) {
    candi.append(i)
}

for _ in 1...n {
    let input = Int(readLine()!)!
    
    if input > stack.last! {
        while candi.last! <= input {
            stack.append(candi.removeLast())
            answer.append("+")
        }
    } else if input < stack.last! {
        possible = false
        break
    }
    
    if input == stack.last {
        answer.append("-")
        stack.removeLast()
    }
}

possible ? answer.forEach { print($0) } : print("NO")
