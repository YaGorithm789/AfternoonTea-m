let ab = readLine()!.split(separator: " ").map { Int($0)! }
let a = Set(readLine()!.split(separator: " ").map { Int($0)! })
let b = readLine()!.split(separator: " ").map { Int($0)! }
let result = a.subtracting(b).sorted().map(String.init)
print(result.count)
print(result.joined(separator: " "))
