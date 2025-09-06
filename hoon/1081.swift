import Foundation

func digitSumPrefix(_ n: Int64) -> Int64 {
    if n <= 0 { return 0 }
    
    var result: Int64 = 0
    var digit: Int64 = 1

    while n / digit > 0 {
        let higher = n / (digit * 10)
        let cur    = (n / digit) % 10
        let lower  = n % digit
        result += higher * 45 * digit
        result += (cur * (cur - 1) / 2) * digit
        result += cur * (lower + 1)
        digit *= 10
    }
    
    return result
}

if let line = readLine() {
    let parts = line.split(separator: " ").compactMap { Int64($0) }
    let L = parts[0], U = parts[1]
    let answer = digitSumPrefix(U) - digitSumPrefix(L - 1)
    print(answer)
}
