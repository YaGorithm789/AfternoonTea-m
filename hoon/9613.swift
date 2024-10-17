let n = Int(readLine()!)!

func gcd(_ m: Int, _ n: Int) -> Int {
    if n == 0 {
        return m
    } else {
        return gcd(n, m % n)
    }
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var result: [Int] = []
  
    for i in 1..<input.count - 1 {
        for j in i + 1..<input.count {
            result.append(gcd(input[i], input[j]))
        }
    }
  
    print(result.reduce(0, +))
}
