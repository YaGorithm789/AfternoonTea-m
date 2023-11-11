let input = readLine()!
var array = [Int](repeating: 0, count: 26)
let start = Int(UnicodeScalar("a").value)

input.forEach { array[Int(UnicodeScalar(String($0))!.value) - start] += 1 }

print(array.map { String($0) }.joined(separator: " "))
