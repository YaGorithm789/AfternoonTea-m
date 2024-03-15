let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

array.sort()

var end = 0
var result = Int.max

for start in 0..<n {
    while end < n && array[end] - array[start] < m {
        end += 1
    }
    
    if end == n {
        break
    }
    
    result = min(result, array[end] - array[start])
}

print(result)
