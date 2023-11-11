let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var box = [Int](repeating: 0, count: n)
(0..<n).forEach { box[$0] = $0 + 1 }

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (input[0] - 1, input[1] - 1)
    box[i...j].reverse()
}

box.forEach { print($0, terminator: " ") }
