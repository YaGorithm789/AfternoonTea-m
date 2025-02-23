var N = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: 0, count: N), count: N)
let INF = Int(1e9)
var dp = Array(repeating: Array(repeating: INF, count: 1 << N), count: N)

for i in 0..<N {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func travel(x: Int, visited: Int) -> Int {
    if visited >= (1 << N) - 1 {
        if matrix[x][0] != 0 {
            return matrix[x][0]
        } else {
            return INF
        }
    }

    if dp[x][visited] != INF {
        return dp[x][visited]
    }

    for i in 1..<N {
        if visited & (1 << i) == 0 && matrix[x][i] != 0 {
            dp[x][visited] = min(dp[x][visited], travel(x: i, visited: visited | (1 << i)) + matrix[x][i])
        }
    }

    return dp[x][visited]
}

print(travel(x: 0, visited: 1))
