import Foundation

let n = Int(readLine()!)!
var stack = [String]()

for _ in 1...n {
    let input = readLine()!.components(separatedBy: " ")
    
    switch input[0] {
    case "push":
        stack.append(input[1])
    case "pop":
        print(stack.isEmpty ? -1 : stack.popLast()!)
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    case "top":
        print(stack.isEmpty ? -1 : stack.last!)
    default:
        break
    }
}
