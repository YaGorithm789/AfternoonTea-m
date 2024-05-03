let n = Int(readLine()!)!
var lc = Array(repeating: -1, count: n + 1)
var rc = Array(repeating: -1, count: n + 1)

for _ in 0..<n {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let a = abc[0], b = abc[1], c = abc[2]

    lc[a] = b
    rc[a] = c
}

var count = (n - 1) * 2
var index = 1

while rc[index] != -1 {
    count -= 1
    index = rc[index]
}

print(count)
