import Foundation

let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
let prices = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
var minPrice = Int.max
var minDigit = -1
var minNonZeroPrice = Int.max
var minNonZeroDigit = -1

for d in 0..<n {
    if prices[d] < minPrice {
        minPrice = prices[d]
        minDigit = d
    }
}

for d in 1..<n {
    if prices[d] < minNonZeroPrice {
        minNonZeroPrice = prices[d]
        minNonZeroDigit = d
    }
}

if minPrice > m && minNonZeroPrice > m {
    print(0)
    exit(0)
}

if minNonZeroDigit == -1 || minNonZeroPrice > m {
    print(0)
    exit(0)
}

var budget = m - minNonZeroPrice
let extraCount = budget / minPrice
var digits = Array(repeating: minDigit, count: extraCount + 1)
digits[0] = minNonZeroDigit
budget -= extraCount * minPrice

for i in 0..<digits.count {
    let current = digits[i]

    for d in stride(from: n - 1, through: 0, by: -1) {
        if i == 0 && d == 0 && digits.count > 1 { continue }
        
        let diff = prices[d] - prices[current]
        
        if diff <= budget {
            if d != current {
                digits[i] = d
                budget -= diff
            }
            
            break
        }
    }
}

if digits.count == 0 {
    print(0)
} else {
    let result = digits.map(String.init).joined()
    print(result)
}
