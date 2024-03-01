import Foundation

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
var isPrime = Array(repeating: true, count: n + 1)
isPrime[1] = false

for i in 2..<Int(sqrt(Double(n)) + 1) {
    if isPrime[i] {
        var j = 2
        
        while i * j <= n {
            isPrime[i * j] = false
            j += 1
        }
    }
}

for i in m...n {
    if isPrime[i] {
        print(i)
    }
}
