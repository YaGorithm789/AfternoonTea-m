let adj = [[1], [2], [3], [4], [5], [6, 21], [7], [8], [9], [10], [11, 27], [12], [13], [14], [15], [16, 29], [17], [18], [19], [20], [32], [22], [23], [24], [25], [26], [20], [28], [24], [30], [31], [24], [32], [32], [32], [32], [32]]
let score = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 13, 16, 19, 25, 30, 35, 22, 24, 28, 27, 26, 0]

func dfs(_ n: Int, _ sum: Int) {
    if n == 10 {
        ans = max(ans, sum)
        return
    }
    
    for j in 0..<4 {
        let s = v[j]
        var c = adj[s].last!
        
        for _ in 1..<list[n] {
            c = adj[c].first!
        }
        
        if c == 32 || !v.contains(c) {
            v[j] = c
            dfs(n + 1, sum + score[c])
            v[j] = s
        }
    }
}

let list = readLine()!.split(separator: " ").map{ Int($0)! }
var v = [0, 0, 0, 0]
var ans = 0
dfs(0, 0)
print(ans)
