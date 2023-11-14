let n = Int(readLine()!)!
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
var prev = Array(-1...n - 2)
var next = Array(1...n)
var index = 0
var result = [String]()

prev[0] = n - 1
next[n - 1] = 0

while result.count != n {
    result.append(String(index + 1))
    prev[next[index]] = prev[index]
    next[prev[index]] = next[index]
    
    if data[index] > 0 {
        for _ in 1...data[index] {
            index = next[index]
        }
    } else {
        for _ in 1...abs(data[index]) {
            index = prev[index]
        }
    }
}

print(result.joined(separator: " "))
