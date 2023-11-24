let k = Int(readLine()!)!
var stack = [String]()

for _ in 1...k {
    let input = readLine()!
    
    switch input {
    case "0":
        stack.removeLast()
    default:
        stack.append(input)
    }
}

print(stack.reduce(0) { $0 + Int($1)! })
