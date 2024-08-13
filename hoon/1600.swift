var k = Int(String(readLine()!))!
var wh = readLine()!.split(separator: " ").map{ Int(String($0))! }
var w = wh[0]
var h = wh[1]
var arr = [[Int]]()
var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]
var horseDx = [-2, -1, -2, -1, 1, 2, 2, 1]
var horseDy = [-1, -2, 1, 2, -2, -1, 1, 2]

for _ in 0..<h{
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func bfs() -> Int{
    var queue = [(Int, Int, Int, Int)]()
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 31), count: 201), count: 201)
    queue.append((0, 0, 0, k))
    visited[0][0][k] = true
    var result = -1
    var idx = 0
    
    while queue.count > idx{
        let (x, y, move, k) = queue[idx]
        idx += 1
        
        if x == h - 1 && y == w - 1 {
            result = move
            break
        }

        if k > 0 {
            for i in 0..<8{
                let nx = horseDx[i] + x
                let ny = horseDy[i] + y

                if nx < 0 || ny < 0 || nx >= h || ny >= w {continue}
                if arr[nx][ny] == 1 || visited[nx][ny][k - 1] {continue}
                
                queue.append((nx, ny, move + 1, k - 1))
                visited[nx][ny][k - 1] = true
            }
        }
        
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= h || ny >= w {continue}
            if arr[nx][ny] == 1 || visited[nx][ny][k] {continue}
            
            queue.append((nx, ny, move + 1, k))
            visited[nx][ny][k] = true
        }
    }
    
    return result
}

print(bfs())
