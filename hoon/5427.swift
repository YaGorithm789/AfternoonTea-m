let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let width = input[0]
    let height = input[1]
    var graph = [[String]]()
    
    var queue = [(Int, Int)]()
    var fireQueue = [(Int, Int)]()
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    for i in 0..<height {
        let input = readLine()!.map{String($0)}
        graph.append(input)
        
        for j in 0..<width {
            if input[j] == "@" {
                queue.append((i, j))
            } else if input[j] == "*" {
                fireQueue.append((i, j))
            }
        }
    }
    
    var fireIndex = 0
    var queueIndex = 0
    var count = 0
    var flag = false
    
    while queue.count > queueIndex {
        count += 1
        
        for _ in 0..<fireQueue.count-fireIndex {
            let (y, x) = fireQueue[fireIndex]
            fireIndex += 1
            
            for i in 0..<4 {
                let nx = dx[i] + x
                let ny = dy[i] + y
                
                if 0..<width ~= nx && 0..<height ~= ny && graph[ny][nx] != "#" && graph[ny][nx] != "*" {
                    graph[ny][nx] = "*"
                    fireQueue.append((ny, nx))
                }
            }
        }
        
        for _ in 0..<queue.count-queueIndex {
            let (y, x) = queue[queueIndex]
            queueIndex += 1
            
            for i in 0..<4 {
                let nx = dx[i] + x
                let ny = dy[i] + y
                
                if 0..<width ~= nx && 0..<height ~= ny {
                    if graph[ny][nx] == "." {
                        graph[ny][nx] = "@"
                        queue.append((ny, nx))
                    }
                } else {
                    print(count)
                    flag = true
                    break
                }
            }
            
            if flag {
                break
            }
        }
        
        if flag {
            break
        }
    }
    
    if !flag {
        print("IMPOSSIBLE")
    }
}
