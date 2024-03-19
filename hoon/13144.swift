let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0
var end = 0
var hasItem = Array(repeating: false, count: 100001)

for start in 0..<n {
    while end < n {
        if hasItem[array[end]] {
            hasItem[array[start]] = false
            break
        } else {
            hasItem[array[end]] = true
            end += 1
            result += end - start
        }
    }
}

print(result)
