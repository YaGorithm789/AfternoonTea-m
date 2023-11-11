let number = readLine()!
var array = [Int](repeating: 0, count: 10)

number.map { array[Int(String($0))!] += 1 }

let sixNine = (array[6] + array[9] + 1) / 2
array[6] = sixNine
array[9] = sixNine

print(array.max()!)
