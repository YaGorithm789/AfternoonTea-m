let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s) = (input[0], input[1])
let array = readLine()!.split(separator: " ").map { Int($0)! }
var end = 0
var sum = array[0]
var result = n + 1

for start in 0..<n {
    while end < n && sum < s {
        end += 1
        
        if end != n { sum += array[end] }
    }
    
    if end == n { break }
    
    result = min(result, end - start + 1)
    sum -= array[start]
}

print(result == n + 1 ? 0 : result)
