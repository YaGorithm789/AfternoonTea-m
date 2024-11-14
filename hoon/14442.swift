import Foundation

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
let ds: [(i: Int, j: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: k+1)

for _ in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    map.append(line)
}

var queue: [(i: Int, j: Int, coin: Int, cost: Int)] = [(0, 0, k, 1)]
var idx = 0

while queue.count > idx {
    let poped = queue[idx]
    idx += 1
    
    if poped.i == n - 1 && poped.j == m - 1 {
        print(poped.cost)
        exit(0)
    }
    
    for d in ds {
        let i = poped.i + d.i
        let j = poped.j + d.j
        
        if 0..<n ~= i && 0..<m ~= j {
            if poped.coin > 0 {
                if !visited[poped.coin][i][j] {
                    visited[poped.coin][i][j] = true
                    if map[i][j] == 0 {
                        queue.append((i, j, poped.coin, poped.cost + 1))
                    }
                    
                    if map[i][j] == 1 {
                        queue.append((i, j, poped.coin - 1, poped.cost + 1))
                    }
                }
            } else {
                if map[i][j] == 0 {
                    if !visited[0][i][j] {
                        visited[0][i][j] = true
                        queue.append((i, j, poped.coin, poped.cost + 1))
                    }
                }
            }
        }
    }
}

print(-1)
