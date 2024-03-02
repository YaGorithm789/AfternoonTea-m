import Foundation

var n = Int(readLine()!)!

for i in 2..<Int(sqrt(Double(n)) + 1) {
    while n % i == 0 {
        n /= i
        print(i)
    }
}

if n != 1 { print(n) }
