let n = Int(readLine()!)!
let mod = 1_000_000_000
var cache = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)

for i in 1...9 {
    cache[1][i] = 1
}

for i in 2...100 {
    for j in 0..<10 {
        if j == 0 {
            cache[i][0] = cache[i - 1][1] % mod
            continue
        }
        
        if j == 9 {
            cache[i][9] = cache[i - 1][8] % mod
            continue
        }
        
        cache[i][j] = cache[i - 1][j - 1] + cache[i - 1][j + 1]
        cache[i][j] %= mod
    }
}

print(cache[n].reduce(0, +) % mod)
