import Foundation

var outputs: [String] = []

while let line = readLine() {
    let tokens = line.split(separator: " ")
    if tokens.isEmpty { continue }
    if tokens.count == 1, tokens[0] == "0" { break }

    let numbers = tokens.compactMap { Int($0) }
    let n = numbers[0]
    var value = 1
    var idx = 1

    for _ in 0..<n {
        let a = numbers[idx]
        let b = numbers[idx + 1]
        value = value * a - b
        idx += 2
    }

    outputs.append(String(value))
}

print(outputs.joined(separator: "\n"))
