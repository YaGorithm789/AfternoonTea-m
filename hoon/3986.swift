let n = Int(readLine()!)!
var result = 0

for _ in 1...n {
    let word = readLine()!
    var stack = [Character]()
    
    for char in word {
        if char == stack.last {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    result += stack.isEmpty ? 1 : 0
}

print(result)
