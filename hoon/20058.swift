import Foundation

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func printMap() {
    for l in map {
        for n in l {
            print(n, terminator: " ")
        }
        
        print("")
    }
}

let nq = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nq[0], q = nq[1]
var size = Int(pow(2.0, Double(n)))
var map: [[Int]] = []

for _ in 0..<size {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

let l = readLine()!.components(separatedBy: " ").map { Int($0)! }

func turnMap(_ l: Int) {
    let jump = Int(pow(2.0, Double(l)))

    for i in stride(from: 0, to: size, by: jump) {
        for j in stride(from: 0, to: size, by: jump) {
            let tmpMap = map[i..<i + jump].map { Array($0[j..<j + jump]) }
            
            for x in 0..<tmpMap.count {
                for y in 0..<tmpMap[0].count {
                    map[i + x][j + y] = tmpMap[tmpMap.count - y - 1][x]
                }
            }
        }
    }
}

func meltingIce() {
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: size), count: size)
    
    for i in 0..<size {
        for j in 0..<size {
            guard map[i][j] > 0 else {
                continue
            }
            
            for k in 0..<4 {
                let nx = i + dx[k]
                let ny = j + dy[k]
                
                guard (0..<size) ~= nx, (0..<size) ~= ny else {
                    continue
                }
                
                if map[nx][ny] > 0 {
                    visited[i][j] += 1
                }
            }
        }
    }
    
    for i in 0..<size {
        for j in 0..<size {
            if map[i][j] > 0 && visited[i][j] < 3 {
                map[i][j] -= 1
            }
        }
    }
}

for i in 0..<q {
    turnMap(l[i])
    meltingIce()
}

var maxCountResult = 0
var iceCountResult = 0
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)

for i in 0..<size {
    for j in 0..<size {
        if map[i][j] > 0 {
            iceCountResult += map[i][j]
        }
        
        if !visited[i][j] && map[i][j] > 0 {
            visited[i][j] = true
            
            var queue: [(Int, Int)] = [(i, j)]
            var index = 0
            
            while index < queue.count {
                let node = queue[index]
                index += 1
                
                for k in 0..<4 {
                    let nx = node.0 + dx[k]
                    let ny = node.1 + dy[k]
                    
                    guard (0..<size) ~= nx, (0..<size) ~= ny, !visited[nx][ny] else {
                        continue
                    }
                    
                    visited[nx][ny] = true
                    
                    if map[nx][ny] > 0 {
                        queue.append((nx, ny))
                    }
                }
            }
            
            maxCountResult = max(maxCountResult, queue.count)
        }
    }
}

print(iceCountResult)
print(maxCountResult)
