let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var visited = [Int](repeating: -1, count: 100_001)
var queue = [(n, 0)]
var index = 0
visited[n] = 0

while queue.count > index {
    let current = queue[index].0
    let time = queue[index].1
    
    if current == k {
        print(time)
        break
    }
    
    for i in [-1, 1, current] {
        let next = current + i
        
        if 0...100_000 ~= next && visited[next] == -1 {
            visited[next] = current
            queue.append((next, time + 1))
        }
    }
    
    index += 1
}

var route: [Int] = []
var i = k

while i != n {
    route.append(i)
    i = visited[i]
}

route.append(n)

print(route.reversed().map { String($0) }.joined(separator: " "))
