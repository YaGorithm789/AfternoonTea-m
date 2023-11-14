let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
var prev = Array(-1...n - 2)
var next = Array(1...n)
var data = Array(1...n)

prev[0] = n - 1
next[n - 1] = 0

var index = k - 1
var result = [String]()

while next[index] != -1 {
    result.append(String(data[index]))
    next[prev[index]] = next[index]
    prev[next[index]] = prev[index]
    let curr = index

    for _ in 1...k {
        index = next[index]
    }
    
    next[curr] = -1
}

print("<" + result.joined(separator: ", ") + ">")
