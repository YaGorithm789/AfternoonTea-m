import Foundation

let n = Int(readLine()!
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

var primes: [Int] = []
primes.reserveCapacity(80_000)
            
for x in 2...limit where isPrime[x] {
    primes.append(x)
}

var output = String()
            
for _ in 0..<n {
    let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    let S = Int64(line)!

    var ok = true
    for p in primes {
        let pp = Int64(p)
        
        if pp * pp > S { break }
        if S % pp == 0 { 
            ok = false
            break
        }
    }
    
    output += ok ? "YES\n" : "NO\n"
}

print(output, terminator: "")
