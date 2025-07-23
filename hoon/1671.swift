import Foundation

func solution() {
    let n = Int(readLine()!)!
    var sharks: [(Int, Int, Int)] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        sharks.append((input[0], input[1], input[2]))
    }
    
    var adj: [[Bool]] = Array(repeating: Array(repeating: false, count: 2 * n), count: 2 * n)
    
    for i in 0..<n {
        for j in 0..<n {
            if i == j { continue }
            if sharks[i].0 >= sharks[j].0 && sharks[i].1 >= sharks[j].1 && sharks[i].2 >= sharks[j].2 {
                if sharks[i].0 == sharks[j].0 && sharks[i].1 == sharks[j].1 && sharks[i].2 == sharks[j].2 {
                    // 두 상어의 능력치가 같은 경우, 먼저 나온 상어가 잡아먹힘
                    if i < j {
                        adj[i][j + n] = true
                    }
                } else {
                   adj[i][j + n] = true 
                }
            }
        }
    }
    
    var match: [Int] = Array(repeating: -1, count: 2 * n)
    var visited: [Bool] = Array(repeating: false, count: 2 * n)
    var result = 0
    
    func dfs(_ u: Int) -> Bool {
        visited[u] = true
        for v in 0..<2*n {
            if adj[u][v] {
                if match[v] == -1 || (!visited[match[v]] && dfs(match[v])) {
                    match[v] = u
                    return true
                }
            }
        }
        return false
    }
    
    for _ in 0..<2 {
        for i in 0..<n {
            visited = Array(repeating: false, count: 2 * n)
            if dfs(i) {
                result += 1
            }
        }
    }
    
    print(n - result)
}

solution()
