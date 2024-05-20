let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var d = Array(repeating: Array(repeating: Int.max, count: n), count: n)

for _ in 0..<m {
    let abt = readLine()!.split(separator: " ").map { Int($0)! }
    let a = abt[0] - 1, b = abt[1] - 1, t = abt[2]
    
    d[a][b] = t
}

let k = Int(readLine()!)!
let c = readLine()!.split(separator: " ").map { Int($0)! - 1 }

for i in 0..<n {
    d[i][i] = 0
}

for k in 0..<n {
    for i in 0..<n where d[i][k] != .max {
        for j in 0..<n where d[k][j] != .max {
            if d[i][k] + d[k][j] < d[i][j] {
                d[i][j] = d[i][k] + d[k][j]
            }
        }
    }
}

var result = Array(repeating: 0, count: n)

for s in c {
    for x in 0..<n {
        result[x] = max(result[x], d[s][x] + d[x][s])
    }
}

var minimum = result.min()!

print(result.enumerated().filter { $0.element == minimum }.map { String($0.offset + 1) }.joined(separator: " "))
