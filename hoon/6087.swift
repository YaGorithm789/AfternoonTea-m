enum Direction {
    case vertical
    case horizontal
    case neutral
    case none
}

struct Heap {
    private var heap: [((Int, Int, Direction), Int)] = []
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    mutating func insert(_ v: ((Int, Int, Direction), Int)) {
        heap.append(v)
        var curIdx = heap.count - 1
        
        while curIdx > 0 && heap[curIdx].1 < heap[(curIdx - 1) / 2].1 {
            heap.swapAt(curIdx, (curIdx - 1) / 2)
            curIdx = (curIdx - 1) / 2
        }
    }
    
    mutating func delete() -> ((Int, Int, Direction), Int) {
        let popped = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        var curIdx = 0
        
        while curIdx * 2 + 1 < heap.count {
            let lChildIdx = curIdx * 2 + 1
            let rChildIdx = lChildIdx + 1
            var mChildIdx = lChildIdx
            
            if rChildIdx < heap.count && heap[rChildIdx].1 < heap[mChildIdx].1 {
                mChildIdx = rChildIdx
            }
            
            if heap[curIdx].1 > heap[mChildIdx].1 {
                heap.swapAt(curIdx, mChildIdx)
                curIdx = mChildIdx
            } else {
                break
            }
        }
        
        return popped
    }
}

func dijkstra() {
    let moves = [(-1, 0, Direction.vertical), (1, 0, Direction.vertical), (0, -1, Direction.horizontal), (0, 1, Direction.horizontal)]
    var distances = [[Int]](repeating: [Int](repeating: 999_999_999, count: w), count: h)
    var directions = [[Direction]](repeating: [Direction](repeating: .none, count: w), count: h)
    var heap = Heap()
    heap.insert(((cs[0].0, cs[0].1, .neutral), 0))
    distances[cs[0].0][cs[0].1] = 0
    
    while !heap.isEmpty {
        let (node, cost) = heap.delete()
        
        if distances[node.0][node.1] < cost {
            continue
        }
        
        let currentDir = node.2
        
        for move in moves {
            let newNode = (node.0 + move.0, node.1 + move.1)
            
            if newNode.0 < 0 || newNode.0 >= h || newNode.1 < 0 || newNode.1 >= w { continue }
            
            if graph[newNode.0][newNode.1] == "*" {
                continue
            }
            
            var newCost = 0
            
            if currentDir != move.2 && currentDir != .neutral {
                newCost += 1
            }
            
            if distances[newNode.0][newNode.1] > cost + newCost {
                distances[newNode.0][newNode.1] = cost + newCost
                directions[newNode.0][newNode.1] = move.2
                heap.insert(((newNode.0, newNode.1, move.2), cost + newCost))
            }
            
            if distances[newNode.0][newNode.1] == cost + newCost && directions[newNode.0][newNode.1] != .neutral && move.2 != directions[newNode.0][newNode.1] {
                distances[newNode.0][newNode.1] = cost + newCost
                directions[newNode.0][newNode.1] = .neutral
                heap.insert(((newNode.0, newNode.1, move.2), cost + newCost))
            }
        }
    }
    
    print(distances[cs[1].0][cs[1].1])
}

let wh = readLine()!.split(separator: " ").map { Int(String($0))! }
let (w, h) = (wh[0], wh[1])
var graph = [[String]]()
var cs = [(Int, Int)]()

for _ in 0..<h {
    graph.append(readLine()!.map {
        let element = String($0)
        return element
    })
}

for row in 0..<h {
    for column in 0..<w {
        if graph[row][column] == "C" {
            cs.append((row, column))
        }
    }
}

dijkstra()
