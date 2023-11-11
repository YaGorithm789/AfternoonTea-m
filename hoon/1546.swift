let n = Double(readLine()!)!
let score = readLine()!.split(separator: " ").map { Double($0)! }
let best = score.max()!

print(score.map { $0 / best * 100 }.reduce(0, +) / n)
