let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let s = input[0]
let k = input[1]
let quotient = s / k
let remainder = s % k
var maxProduct = 1

for _ in 0..<remainder {
    maxProduct *= quotient + 1
}

for _ in 0..<(k - remainder) {
    maxProduct *= quotient
}

print(maxProduct)
