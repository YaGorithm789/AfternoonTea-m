import Foundation

// 첫 줄: 테스트 개수
let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!

// 1,000,000 이하 소수 구하기 (에라토스테네스의 체)
let limit = 1_000_000
var isPrime = [Bool](repeating: true, count: limit + 1)
isPrime[0] = false
isPrime[1] = false

var i = 2
while i * i <= limit {
    if isPrime[i] {
        var j = i * i
        while j <= limit {
            isPrime[j] = false
            j += i
        }
    }
    i += 1
}

var primes = [Int]()
for x in 2...limit {
    if isPrime[x] { primes.append(x) }
}

// 각 수 S에 대해 소수로 나눠 떨어지는지 확인
var result = ""
for _ in 0..<n {
    let s = Int64(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!

    var ok = true
    for p in primes {
        let pp = Int64(p)
        if pp * pp > s { break }   // sqrt(s)까지 확인
        if s % pp == 0 { ok = false; break }
    }
    result += ok ? "YES\n" : "NO\n"
}

print(result, terminator: "")
