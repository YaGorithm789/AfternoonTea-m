var left = Array(readLine()!)
var right: [Character] = []
let n = Int(readLine()!)!

for _ in 0..<n {
    let edit = readLine()!
    
    switch edit {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D" :
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B" :
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(edit.last!)
    }
}

print(String(left + right.reversed()))
