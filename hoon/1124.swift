import Foundation

// 소수 판별 함수
func isPrime(_ num: Int) -> Bool {
    if num <= 1 { return false }
    if num <= 3 { return true }
    var i = 2
    while i * i <= num {
        if num % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

// 소인수 개수 구하는 함수
func countPrimeFactors(_ num: Int) -> Int {
    var n = num
    var count = 0
    var i = 2
    while i * i <= n {
        while n % i == 0 {
            count += 1
            n /= i
        }
        i += 1
    }
    if n > 1 {
        count += 1
    }
    return count
}

// 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = input[0]
let b = input[1]

// 결과 변수 초기화
var result = 0

// 범위 탐색
for num in a...b {
    let primeFactorCount = countPrimeFactors(num)
    if isPrime(primeFactorCount) {
        result += 1
    }
}

// 결과 출력
print(result)
