let n = Int(readLine()!)!
var primeNumber = Array(repeating: true, count: n + 1)
var array = [Int]()

for i in 2..<n + 1 {
    if primeNumber[i] {
        var j = 2
        array.append(i)
        
        while i * j <= n {
            primeNumber[i * j] = false
            j += 1
        }
    }
}

var length = array.count
var result = 0
var sum = 0
var start = 0
var end = 0

while end <= length {
    if sum >= n {
        sum -= array[start]
        start += 1
    } else {
        if end < length { sum += array[end] }
        end += 1
    }

    if sum == n {
        result += 1
    }
}

print(result)
