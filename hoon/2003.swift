let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let array = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0
var end = 0
var sum = 0
var result = 0

while end <= n {
    if sum < m {
        if end < n { sum += array[end] }
        end += 1
    } else {
        sum -= array[start]
        start += 1
    }
    
    if sum == m {
        result += 1
    }
}

print(result)
