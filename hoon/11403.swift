let n = Int(readLine()!)!
var adj = [[String]]()
var result = Array(repeating: Array(repeating: "0", count: n), count: n)
var visited = Array(repeating: false, count: n)

for _ in 0..<n {
    adj.append(readLine()!.split(separator: " ").map(String.init))
}

func dfs(start: Int, now: Int) {
    for i in 0..<n {
        if adj[now][i] == "1" && visited[i] == false {
            result[start][i] = "1"
            visited[i] = true
            dfs(start: start, now: i)
        }
    }
}

for i in 0..<n {
    dfs(start: i, now: i)
    visited = Array(repeating: false, count: n)
}

result.forEach {
    print($0.joined(separator: " "))
}
