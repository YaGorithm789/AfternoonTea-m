func solution() {
    let nmr = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nmr[0], m = nmr[1], r = nmr[2]
    let t = readLine()!.split(separator: " ").map { Int($0)! }
    var d = Array(repeating: Array(repeating: 31, count: n), count: n)
    var result = 0
    
    for _ in 0..<r {
        let abl = readLine()!.split(separator: " ").map { Int($0)! }
        let a = abl[0] - 1, b = abl[1] - 1, l = abl[2]
    
        d[a][b] = l
        d[b][a] = l
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
    
    for cur in 0..<n {
        var answer = 0
    
        for i in 0..<n where d[cur][i] <= m {
            answer += t[i]
        }
    
        result = max(result, answer)
    }
    
    print(result)
}

solution()
