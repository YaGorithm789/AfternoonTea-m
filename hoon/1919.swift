let before = readLine()!
let after = readLine()!
var alpha = [Int](repeating: 0, count: 26)

before.forEach { alpha[Int(UnicodeScalar(String($0))!.value) - 97] += 1 }
after.forEach { alpha[Int(UnicodeScalar(String($0))!.value) - 97] -= 1 }

print(alpha.reduce(0) { $0 + abs($1) })
