let parts = readLine()!.split(separator: " ").map { Int($0)! }
let A = parts[0], B = parts[1]
var count = 0

func dfs(_ x: Int) {
    if x > B { return }
    if x >= A { count += 1 }
    
    let next1 = x * 10 + 4
    let next2 = x * 10 + 7
    dfs(next1)
    dfs(next2)
}

dfs(4)
dfs(7)
print(count)
