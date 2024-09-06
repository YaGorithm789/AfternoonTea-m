let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = nm[0]
let m = nm[1]
let rcd = readLine()!.split(separator: " ").map{ Int(String($0))! }
let r = rcd[0]
let c = rcd[1]
let d = rcd[2]
var arr = [[Int]]()

for _ in 0..<n{
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var result = 1
visited[r][c] = true
var curD = d
var curR = r
var curC = c
var cnt = 0

while true {
    curD -= 1
    
    if curD == -1 {
        curD = 3
    }
    
    var nx = curR + dx[curD]
    var ny = curC + dy[curD]
    
    if !visited[nx][ny] && arr[nx][ny] != 1 {
        visited[nx][ny] = true
        curR = nx
        curC = ny
        result += 1
        cnt = 0
        continue
    } else {
        cnt += 1
    }
    
    if cnt == 4 {
        cnt = 0
        nx = curR - dx[curD]
        ny = curC - dy[curD]
        
        if arr[nx][ny] != 1 {
            curR = nx
            curC = ny
        } else {
            break
        }
    }
}

print(result)
