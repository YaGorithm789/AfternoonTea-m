let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var ice: [[Int]] = []

for _ in 0..<input[0] {
    ice.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
let zero = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
var result = 0

outer: while true {
    var queue: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])
    var count = 0
    var tempIce = ice
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if ice[i][j] != 0 && !visited[i][j] {
                count += 1
                
                if count > 1 {
                    break outer
                }
                
                queue.append([i,j])
                visited[i][j] = true
                
                while !queue.isEmpty {
                    let current = queue.removeFirst()
                    var tempCount = 0
                    
                    for k in 0..<dx.count {
                        let newX = current[0] + dx[k]
                        let newY = current[1] + dy[k]
                        
                        if newX < 0 || newY < 0 || newX >= input[0] || newY >= input[1] {
                            continue
                        }
                        
                        if ice[newX][newY] == 0 {
                            tempCount += 1
                            continue
                        }
                        
                        if !visited[newX][newY] {
                            queue.append([newX,newY])
                            visited[newX][newY] = true
                        }
                    }
                    
                    tempIce[current[0]][current[1]] = ice[current[0]][current[1]] >= tempCount ? ice[current[0]][current[1]] - tempCount : 0
                }
            }
        }
    }
    
    result += 1
    
    if tempIce == zero {
        result = 0
        break
    }
    
    ice = tempIce
}

print(result)
