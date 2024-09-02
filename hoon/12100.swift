func dfs(_ size: Int) {
    if size == 5 {
        for row in 0..<n {
            for column in 0..<n {
                answer = max(answer, graph[row][column])
            }
        }
        
        return
    }
    
    for i in 0..<4 {
        let currentGraph = graph
        shift(i)
        dfs(size + 1)
        graph = currentGraph
    }
}

func shift(_ order: Int) {
    var isMerged = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    if order == 0 {
        for row in 0..<n {
            for column in 0..<n {
                if graph[row][column] != 0 {
                    var newRow = row
                    
                    while newRow > 0 {
                        if graph[newRow - 1][column] == 0 {
                            let temp = graph[newRow][column]
                            graph[newRow][column] = graph[newRow - 1][column]
                            graph[newRow - 1][column] = temp
                            newRow -= 1
                        } else if graph[newRow][column] == graph[newRow - 1][column] {
                            if isMerged[newRow - 1][column] {
                                break
                            }
                            
                            let temp = graph[newRow][column]
                            graph[newRow][column] = graph[newRow - 1][column]
                            graph[newRow - 1][column] = temp * 2
                            graph[newRow][column] = 0
                            isMerged[newRow - 1][column] = true
                            break
                        } else {
                            break
                        }
                    }
                }
            }
        }
    }
    
    if order == 1 {
        for column in 0..<n {
            for row in (0..<n).reversed() {
                if graph[row][column] != 0 {
                    var newRow = row
                    
                    while newRow < n - 1 {
                        if graph[newRow + 1][column] == 0 {
                            let temp = graph[newRow][column]
                            graph[newRow][column] = graph[newRow + 1][column]
                            graph[newRow + 1][column] = temp
                            newRow += 1
                        } else if graph[newRow][column] == graph[newRow + 1][column] {
                            if isMerged[newRow + 1][column] {
                                break
                            }
                            
                            let temp = graph[newRow][column]
                            graph[newRow][column] = graph[newRow + 1][column]
                            graph[newRow + 1][column] = temp * 2
                            graph[newRow][column] = 0
                            isMerged[newRow + 1][column] = true
                            break
                        } else {
                            break
                        }
                    }
                }
            }
        }
    }
    
    if order == 2 {
        for row in 0..<n {
            for column in 0..<n {
                if graph[row][column] != 0 {
                    var newColumn = column
                    
                    while newColumn > 0 {
                        if graph[row][newColumn - 1] == 0 {
                            let temp = graph[row][newColumn]
                            graph[row][newColumn] = graph[row][newColumn - 1]
                            graph[row][newColumn - 1] = temp
                            newColumn -= 1
                        } else if graph[row][newColumn] == graph[row][newColumn - 1] {
                            if isMerged[row][newColumn - 1] {
                                break
                            }
                            
                            let temp = graph[row][newColumn]
                            graph[row][newColumn] = graph[row][newColumn - 1]
                            graph[row][newColumn - 1] = temp * 2
                            graph[row][newColumn] = 0
                            isMerged[row][newColumn - 1] = true
                            break
                        } else {
                            break
                        }
                    }
                }
            }
        }
    }
    
    if order == 3 {
        for row in 0..<n {
            for column in (0..<n).reversed() {
                if graph[row][column] != 0 {
                    var newColumn = column
                    
                    while newColumn < n - 1 {
                        if graph[row][newColumn + 1] == 0 {
                            let temp = graph[row][newColumn]
                            graph[row][newColumn] = graph[row][newColumn + 1]
                            graph[row][newColumn + 1] = temp
                            newColumn += 1
                        } else if graph[row][newColumn] == graph[row][newColumn + 1] {
                            if isMerged[row][newColumn + 1] {
                                break
                            }
                            
                            let temp = graph[row][newColumn]
                            graph[row][newColumn] = graph[row][newColumn + 1]
                            graph[row][newColumn + 1] = temp * 2
                            graph[row][newColumn] = 0
                            isMerged[row][newColumn + 1] = true
                            break
                        } else {
                            break
                        }
                    }
                }
            }
        }
    }
}

var n = Int(readLine()!)!
var graph = [[Int]]()
var answer = 0

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

dfs(0)
print(answer)
