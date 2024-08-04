let N = Int(readLine()!)!
var matrix = [[Character]]()

for _ in 0..<N {
    let line = readLine()!.map { $0 }
    matrix.append(line)
}

var check = Array(repeating: Array(repeating: false, count: N), count: N)

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]

func isValid(r: Int, c: Int, color: Character) -> Bool {
    return r >= 0 && r < N && c >= 0 && c < N && matrix[r][c] == color ? true : false
}

func dfs(r: Int, c: Int, color: Character) {
    check[r][c] = true
    
    for i in 0..<4 {
        let nr = r + dr[i]
        let nc = c + dc[i]
        if isValid(r: nr, c: nc, color: color) && !check[nr][nc] {
            dfs(r: nr, c: nc, color: color)
        }
    }

}

var result1 = 0
var result2 = 0

for r in 0..<N {
    for c in 0..<N {
        if !check[r][c] {
            dfs(r: r, c: c, color: matrix[r][c])
            result1 += 1
        }
    }
}

for r in 0..<N {
    for c in 0..<N {
        if matrix[r][c] == "G" {
            matrix[r][c] = "R"
        }
    }
}

check = Array(repeating: Array(repeating: false, count: N), count: N)

for r in 0..<N {
    for c in 0..<N {
        if !check[r][c] {
            dfs(r: r, c: c, color: matrix[r][c])
            result2 += 1
        }
    }
}

print(result1, result2)
