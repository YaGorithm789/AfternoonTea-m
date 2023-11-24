let n = Int(readLine()!)!
var tower = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Int]()
var answer = Array(repeating: 0, count: n)

for i in stride(from: n - 1, to: -1, by: -1) {
    while !stack.isEmpty && tower[i] > tower[stack.last!] {
        let idx = stack.removeLast()
        answer[idx] = i + 1
    }

    stack.append(i)
}

print(answer.map{ String($0) }.joined(separator: " "))
