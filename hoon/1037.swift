let n = Int(readLine()!)!
let divisors = readLine()!.split(separator: " ").map { Int($0)! }
print(divisors.max()! * divisors.min()!)
