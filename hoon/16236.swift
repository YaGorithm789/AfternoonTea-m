import Foundation

let N = Int(readLine()!)!
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var arr = [[Int]]()
var shark = (0, 0)
var queue = [(Int, Int)]()
var distance = [[Int]]()
var fish = [(Int, Int, Int)]()
var result = 0
var size = 2
var exp = 0
let xRange = 0..<N
let yRange = 0..<N

for _ in 0..<N {
    arr.append(readLine()!.components(separatedBy:" ").map{ Int($0)! })
}

for i in 0..<N {
    for j in 0..<N {
        if arr[i][j] == 9 {
            shark = (i, j)
            arr[i][j] = 0
        }
    }
}

func BFS() {
    var index = 0
    distance[shark.0][shark.1] = 1
    queue.append((shark.0, shark.1))
    
    while index < queue.count {
        let cur = queue[index]
        index += 1
        
        for i in 0..<4 {
            var nx = cur.0 + dx[i]
            var ny = cur.1 + dy[i]
            
            if xRange ~= nx, yRange ~= ny, distance[nx][ny] == 0 {
                if arr[nx][ny] != 0, arr[nx][ny] < size {
                    distance[nx][ny] = distance[cur.0][cur.1] + 1
                    fish.append((nx, ny, distance[nx][ny]))
                } 
              
                if arr[nx][ny] == 0 || arr[nx][ny] == size {
                    distance[nx][ny] = distance[cur.0][cur.1] + 1
                    queue.append((nx, ny))
                } 
            }
        }
    }
}

while true {
    queue = [(Int, Int)]()
    distance = Array(repeating: Array(repeating: 0, count: N), count: N)
    fish = [(Int, Int, Int)]()
    BFS()
    
    if fish.isEmpty {
        print(result)
        break
    }
    
    fish = fish.sorted { $0.2 == $1.2 ? ( $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0) : $0.2 < $1.2 }
    
    shark = (fish[0].0, fish[0].1)
    exp += 1
  
    if size == exp {
        size += 1
        exp = 0
    }
  
    arr[fish[0].0][fish[0].1] = 0
    result += (fish[0].2 - 1)
}
