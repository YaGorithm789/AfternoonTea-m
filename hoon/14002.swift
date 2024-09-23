let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var cache = [Int](repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if array[i] > array[j] {
            if cache[i] < cache[j] + 1 {
                cache[i] = cache[j] + 1
            }
        }
    }
}

var LIS: [Int] = []
var length = cache.max()!
print(length)

for i in (0..<n).reversed() {
    if cache[i] == length {
        LIS.append(array[i])
        length -= 1
    }
}

print(LIS.reversed().map { String($0) }.joined(separator: " "))
