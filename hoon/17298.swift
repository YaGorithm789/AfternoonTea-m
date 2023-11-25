let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map{ Int($0)! }
var result = Array(repeating: "-1", count: n)
var stack = [Int]()

for i in 0..<n {
    while let last = stack.last, seq[last] < seq[i] {
        stack.removeLast()
        result[last] = String(seq[i])
    }
    
    stack.append(i)
}

print(result.joined(separator: " "))
