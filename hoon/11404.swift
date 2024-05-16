let n = Int(readLine()!)!
let m = Int(readLine()!)!
let maximum = 0x3f3f3f3f
var d = Array(repeating: Array(repeating: maximum, count: n), count: n)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let a = abc[0] - 1, b = abc[1] - 1, c = abc[2]
    
    d[a][b] = min(d[a][b], c)
}

for i in 0..<n {
    d[i][i] = 0
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            d[i][j] = min(d[i][j], d[i][k] + d[k][j])
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if d[i][j] >= maximum {
            d[i][j] = 0
        }
    }
}

d.forEach {
    print($0.map(String.init).joined(separator: " "))
}
