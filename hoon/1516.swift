struct Queue<T> {
  var elements: [T]
  var index = 0
  
  init(_ elements: [T] = []) {
    self.elements = elements
  }
  
  var isEmpty: Bool {
    !(elements.count > index)
  }
  
  mutating func enqueue(_ element: T) {
    elements.append(element)
  }
  
  mutating func dequeue() -> T {
    index += 1
    return elements[index - 1]
  }
}

import Foundation

func topologySort(_ cost: [Int], _ indegree: [Int], _ graph: [[Int]]) {
  let n = graph.count
  var indegree = indegree
  var queue = Queue<Int>()
  var dp = Array(repeating: 0, count: n)
  
  for i in 1..<n {
    if indegree[i] == 0 {
      queue.enqueue(i)
    }
  }
  
  while queue.isEmpty == false {
    let cur = queue.dequeue()
    
    for next in graph[cur] {
      indegree[next] -= 1
      dp[next] = max(dp[next], dp[cur] + cost[cur])
      
      if indegree[next] == 0 {
        queue.enqueue(next)
      }
    }
  }
  
  for i in 1..<n {
    print(dp[i] + cost[i])
  }
}

func solution() {
  let n = Int(readLine()!)!
  
  var graph = Array(repeating: [Int](), count: n+1)
  var cost = Array(repeating: 0, count: n+1)
  var indegree = Array(repeating: 0, count: n+1)
  
  for i in 1...n {
    let t = readLine()!.split(separator: " ").map { Int($0)! }
    let preBuild = Array(t[1...].dropLast())
    
    cost[i] = t[0]
    
    for building in preBuild {
      graph[building].append(i)
      indegree[i] += 1
    }
  }
  
  topologySort(cost, indegree, graph)
}

solution()
