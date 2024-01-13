let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[1], input[0])
var queue = [(Int, Int)]()
var box = [[Int]]()
var visit = Array(repeating: Array(repeating: -1, count: m), count: n)
let dir = [(-1, 0), (0, -1), (1, 0), (0, 1)]
var pointer = 0

for _ in 1...n {
    box.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
    for j in 0..<m {
        if box[i][j] == -1 { visit[i][j] = 0 }
        guard box[i][j] == 1 else { continue }
        
        queue.append((i, j))
        visit[i][j] = 0
    }
}

while queue.count > pointer {
    let (x, y) = queue[pointer]
    pointer += 1
    
    for (dx, dy) in dir {
        guard 0..<n ~= x + dx,
              0..<m ~= y + dy,
              box[x + dx][y + dy] == 0,
              visit[x + dx][y + dy] == -1
        else { continue }
        
        queue.append((x + dx, y + dy))
        box[x + dx][y + dy] = 1
        visit[x + dx][y + dy] = visit[x][y] + 1
    }
}

let result = visit.flatMap { $0 }
print(result.contains(-1) ? -1 : result.max()!)
