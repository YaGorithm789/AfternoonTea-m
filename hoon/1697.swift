let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
var visit = Array(repeating: -1, count: 100001)
var queue = [n]
let moves = [1, -1, 2]
visit[n] = 0

while queue.isEmpty == false {
    if visit[k] != -1 {
        print(visit[k])
        break
    }
    
    let current = queue.removeFirst()
    
    for move in moves {
        let next = move == 2 ? current * move : current + move
        
        guard (0...100000) ~= next, visit[next] == -1 else { continue }
        
        visit[next] = visit[current] + 1
        queue.append(next)
    }
}
