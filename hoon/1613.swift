let inp = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = inp[0], M = inp[1]
var nodes = Array(repeating: [Int](), count: N + 1)
var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for _ in 0..<M {
    let q = readLine()!.split(separator: " ").map { Int(String($0))! }
    nodes[q[0]].append(q[1])
}

func bfs(_ s: Int) {
    var check = Array(repeating: false, count: N + 1)
    var queue = [s], q = 0
    
    while queue.count > q {
        let f = queue[q]
        q += 1
        
        for next in nodes[f] {
            if check[next] { continue }
            
            check[next] = true
            queue.append(next)
            dp[s][next] = 1
        }
    }
}

for i in 1...N {
    bfs(i)
}

let K = Int(readLine()!)!

for _ in 0..<K {
    let q = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if dp[q[0]][q[1]] == 1 {
        print(-1)
    } else if dp[q[1]][q[0]] == 1{
        print(1)
    } else {
        print(0)
    }
}
