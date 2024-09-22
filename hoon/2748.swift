let input = Int(readLine()!)!
var cache = [Int](repeating: -1, count: input + 1)
cache[0] = 0
cache[1] = 1

func fibo(_ num: Int) -> Int {
    if cache[num] < 0 {
        cache[num] = fibo(num - 2) + fibo(num - 1)
    }
    
    return cache[num]
}

print(fibo(input))
