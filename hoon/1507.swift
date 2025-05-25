let n = Int(readLine()!)!
var originGraph = [[Int]]()
var edges = [[Int]]()
var totalCost = 0

for from in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    originGraph.append(row)
    
    for (to, weight) in row.enumerated() {
        if weight == 0 { continue }
        
        if to > from {
            edges.append([from, to, weight])
        }
    }
}

edges.sort(by: {$0[2] < $1[2]})
var graph = [[Int]](repeating: [Int](repeating: 10001, count: n), count: n)

for i in 0..<n {
    graph[i][i] = 0
}

func floydWarshall() {
    for k in 0..<n {
        for from in 0..<n {
            for to in 0..<n {
                if from == to { continue }
                
                graph[from][to] = min(graph[from][k] + graph[k][to], graph[from][to])
            }
        }
    }
}

for edge in edges {
    let from = edge[0]
    let to = edge[1]
    let weight = edge[2]
  
    if weight < graph[from][to] {
        graph[from][to] = weight
        graph[to][from] = weight
        totalCost += weight
    }
  
    floydWarshall()
}

graph == originGraph ? print(totalCost) : print(-1)
