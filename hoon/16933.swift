import Foundation

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
let ds: [(i: Int, j: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]

var map = [[Int]]()
var visit = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: k + 1)

for _ in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    map.append(line)
}

var queue: [(i: Int, j: Int, coin: Int, cost: Int)] = [(0, 0, k, 1)]
var idx = 0
visit[k][0][0] = true

while queue.count > idx {
    let popped = queue[idx]
    idx += 1
        
    if popped.i == n-1 && popped.j == m-1 {
        print(popped.cost)
        exit(0)
    }
        
    for d in ds {
        let i = popped.i
        let j = popped.j
        let ni = i + d.i
        let nj = j + d.j
        
        if 0..<n ~= ni && 0..<m ~= nj {
            if visit[popped.coin][ni][nj] { continue }
            
            if map[ni][nj] == 1 && popped.coin > 0 {
                if popped.cost % 2 == 1 {
                    visit[popped.coin][ni][nj] = true
                    queue.append((ni, nj, popped.coin - 1, popped.cost + 1))
                } else {
                    queue.append((i, j, popped.coin, popped.cost + 1))
                }
            }
            
            if map[ni][nj] == 0 {
                visit[popped.coin][ni][nj] = true
                queue.append((ni, nj, popped.coin, popped.cost + 1))
            }
        }
    }
}

print(-1)
