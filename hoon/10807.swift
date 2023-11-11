let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map { Int($0)! }
let v = Int(readLine()!)!

print(seq.filter { $0 == v }.count)
