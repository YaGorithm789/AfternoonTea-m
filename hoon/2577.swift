let a = readLine()!
let b = readLine()!
let c = readLine()!
let input = String(Int(a)! * Int(b)! * Int(c)!)
var array = [Int](repeating: 0, count: 10)

input.forEach { array[Int(String($0))!] += 1 }
array.forEach { print($0) }
