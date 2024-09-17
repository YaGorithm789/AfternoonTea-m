import Foundation

let input = readLine()!.components(separatedBy:" ").map{ Int($0)! }
let R = input[0], C = input[1], T = input[2]
var map = [[Int]]()
var tempArr = [[Int]]()
let rowRange = 0...R - 1
let colRange = 0...C - 1
var cleaners: [Int] = []

for _ in 0..<R {
    map.append(readLine()!.components(separatedBy:" ").map{ Int($0)! })
}

for i in 0..<R {
    if map[i][0] == -1 { cleaners.append(i) }
}

let upCleaner = cleaners[0]
let downCleaner = cleaners[1]

for _ in 0..<T {
    tempArr = map
    spread()
    map = tempArr
    clean()
}

var sum = 0

for i in 0..<R {
    for j in 0..<C {
        if map[i][j] != -1 {
            sum += map[i][j]
        }
    }
}

print(sum)

func spread() {
    for i in 0..<R {
        for j in 0..<C {
            if map[i][j] != 0, map[i][j] != -1 {
                var cnt = 0
                let spreadAmount = map[i][j] / 5
                
                for next in [(i + 1, j), (i - 1, j), (i, j - 1), (i, j + 1)] where rowRange ~= next.0 && colRange ~= next.1 {
                    guard map[next.0][next.1] != -1 else { continue }
                    
                    tempArr[next.0][next.1] += spreadAmount
                    cnt += 1
                }
                
                tempArr[i][j] -= spreadAmount * cnt
            }
        }
    }
}

func clean() {    
    for i in stride(from: upCleaner - 1, through: 0, by: -1) {
        if map[i + 1][0] != -1 {
            map[i + 1][0] = map[i][0]
        }
    }
    
    for i in 1..<C {
        map[0][i - 1] = map[0][i]
    }
    
    for i in 1..<upCleaner + 1 {
        map[i - 1][C - 1] = map[i][C - 1]
    }
    
    for i in stride(from: C - 2, through: 1, by: -1) {
        map[upCleaner][i + 1] = map[upCleaner][i]
        
        if i == 1 {
            map[upCleaner][i] = 0
        }
    }
        
    for i in downCleaner + 1..<R {
        if map[i - 1][0] != -1 {
            map[i - 1][0] = map[i][0]
        } 
    }
    
    for i in 1..<C {
        map[R - 1][i - 1] = map[R - 1][i]
    }
    
    for i in stride(from: R - 2, through: downCleaner, by: -1) {
        map[i + 1][C - 1] = map[i][C - 1]
    }
    
    for i in stride(from: C - 2, through: 1, by: -1) {
        map[downCleaner][i + 1] = map[downCleaner][i]
        
        if i == 1 {
            map[downCleaner][i] = 0
        }
    }
}
