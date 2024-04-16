struct MinHeap<T: Comparable> {
    var heap = [T]()
    
    init() { }
    
    mutating func push(data: T) {
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex == 0 {
                return false
            }
            
            let parentIndex = (insertIndex - 1) / 2
            
            return heap[insertIndex] < heap[parentIndex] ? true : false
        }
        
        var insertIndex = heap.count - 1
        
        while isMoveUp(insertIndex) {
            let parentIndex = (insertIndex - 1) / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus {
        case left
        case right
        case none
    }
    
    mutating func pop() -> T? {
        if heap.count == 0 { return nil }
        
        var popIndex = 0
        let returnData = heap[0]
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ popIndex: Int) -> moveDownStatus {
            let leftChildIndex = popIndex * 2 + 1
            let rightChildIndex = popIndex * 2 + 2
            
            if leftChildIndex >= heap.count {
                return .none
            }
            
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] < heap[popIndex] ? .left : .none
            }
            
            if heap[leftChildIndex] > heap[popIndex] && heap[rightChildIndex] > heap[popIndex] {
                return .none
            }
            
            if heap[leftChildIndex] < heap[popIndex] && heap[rightChildIndex] < heap[popIndex] {
                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
            }
            
            return heap[leftChildIndex] <= heap[popIndex] ? .left : .right
        }
        
        while true {
            switch moveDown(popIndex) {
            case .left:
                let leftChildIndex = popIndex * 2 + 1
                heap.swapAt(popIndex, leftChildIndex)
                popIndex = leftChildIndex
            case .right:
                let rightChildIndex = popIndex * 2 + 2
                heap.swapAt(popIndex, rightChildIndex)
                popIndex = rightChildIndex
            case .none:
                return returnData
            }
        }
    }
}

let n = Int(readLine()!)!
var heap = MinHeap<Int>()

for _ in 0..<n {
    let x = Int(readLine()!)!
    
    if x == 0 {
        print(heap.pop() ?? 0)
    } else {
        heap.push(data: x)
    }
}
