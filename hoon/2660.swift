let n = Int(readLine()!)!
var adj = Array(repeating: [Int](), count: n + 1)
var result = [Int]()

while let input = readLine()?.split(separator: " ").map({ Int($0)! }), input != [-1, -1] {
    adj[input[0]].append(input[1])
    adj[input[1]].append(input[0])
}

func bfs(vertex: Int) -> Int {
    var queue = [vertex]
    var index = 0
    var visited = Array(repeating: -1, count: n + 1)
    visited[vertex] = 0

    while queue.count > index {
        let cur = queue[index]

        for i in adj[cur] {
            if visited[i] != -1 { continue }

            queue.append(i)
            visited[i] = visited[cur] + 1
        }
        
        index += 1
    }
    
    return visited.max()!
}

for i in 1...n {
    let score = bfs(vertex: i)
    result.append(score)
}

let score = result.min()!
var count = 0
var candidates = [String]()

for i in 0..<n {
    if result[i] == score {
        count += 1
        candidates.append(String(i + 1))
    }
}

print(score, count)
print(candidates.joined(separator: " "))
