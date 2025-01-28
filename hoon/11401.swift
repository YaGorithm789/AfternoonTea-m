let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0], K = input[1]
let p = 1000000007

func factorial(_ num: Int) -> Int {
    var n = 1
    if num <= 1 { return 1 }
    
    for i in 2...num {
        n = n * i % p
    }
  
    return n
}

func divide(_ n: Int, _ k: Int) -> Int {
    if k == 1 { return n % p }
    let m = divide(n, k / 2)

    if k % 2 == 0 {
        return m * m % p
    } else {
        return (m * m % p) * n % p
    }
}

print(factorial(N) * divide(factorial(N - K) * factorial(K) % p, p - 2) % p)
