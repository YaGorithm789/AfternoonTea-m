let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = input[0], end = input[1]
var graph = [[Int]](repeating: [Int](repeating: 0, count: 0), count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

func bfs(start: Int) -> Int {
    var queue = [(start, 0)]
    var index = 0
    visited[start] = true
    
    while queue.count > index {
        let node = queue[index].0
        let depth = queue[index].1
        
        if node == end {
            return depth
        }
        
        for nextNode in graph[node] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append((nextNode, depth + 1))
            }
        }
        
        index += 1
    }
    
    return -1
}

print(bfs(start: start))
