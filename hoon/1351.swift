let q = readLine()!.split(separator: " " ).map { Int(String($0))! }
let N = q[0], P = q[1], Q = q[2]
var dict = [0: 1]

func dfs(_ n: Int) -> Int {
    if let x = dict[n] {
        return x
    }
    
    dict[n] = dfs(n / P) + dfs(n / Q)
    
    return dict[n]!
}

print(dfs(N))
