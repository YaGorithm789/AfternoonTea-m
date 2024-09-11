import Foundation

let N = Int(readLine()!)!
var arr = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: 101), count: 101)

let dx = [0, -1, 0, 1]
let dy = [1, 0, -1, 0]
var result = 0

for _ in 0..<N {
    arr.append(readLine()!.components(separatedBy:" ").map{ Int($0)! })
}

for element in arr {
    let x = element[1]
    let y = element[0]
    let d = element[2]
    let g = element[3]
    
    visited[x][y] = true
    var stack = [Int]()
    var nx = x + dx[d]
    var ny = y + dy[d]
    visited[nx][ny] = true
    stack.append(d)
    
    for _ in 0..<g {
        for j in stride(from: stack.count - 1, through: 0, by: -1) {
            var k = stack[j] + 1
            
            if k == 4 { k = 0 }
            
            nx = nx + dx[k]
            ny = ny + dy[k]
            visited[nx][ny] = true
            stack.append(k)
        }
    }
}

for i in 0..<100 {
    for j in 0..<100 {
        if visited[i][j], visited[i + 1][j], visited[i][j + 1], visited[i + 1][j + 1] {
            result += 1
        }
    }
}

print(result)
