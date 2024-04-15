struct MinHeap<T: Comparable & SignedNumeric> {
    var heap = [T]()
    
    init() { }
        
    init(data: T) {
        heap.append(data)
        heap.append(data)
    }
    
    mutating func push(data: T) {
        if heap.count == 0 {
            heap.append(data)
            heap.append(data)
            
            return
        }
        
        heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {
                return false
            }
            
            let parentIndex = insertIndex / 2
            
            if abs(heap[insertIndex]) == abs(heap[parentIndex]) {
                return heap[insertIndex] < heap[parentIndex] ? true : false
            }
            
            return abs(heap[insertIndex]) < abs(heap[parentIndex]) ? true : false
        }
        
        var insertIndex = heap.count - 1
        
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
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
        if heap.count <= 1 { return nil }
        
        var popIndex = 1
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ popIndex: Int) -> moveDownStatus {
            let leftChildIndex = popIndex * 2
            let rightChildIndex = popIndex * 2 + 1
            
            if leftChildIndex >= heap.count {
                return .none
            }
            
            if rightChildIndex >= heap.count {
                if abs(heap[leftChildIndex]) == abs(heap[popIndex]) {
                    return heap[leftChildIndex] < heap[popIndex] ? .left : .none
                }
                
                return abs(heap[leftChildIndex]) < abs(heap[popIndex]) ? .left : .none
            }
            
            if abs(heap[leftChildIndex]) > abs(heap[popIndex]) && abs(heap[rightChildIndex]) > abs(heap[popIndex]) {
                return .none
            }
            
            if abs(heap[leftChildIndex]) < abs(heap[popIndex]) && abs(heap[rightChildIndex]) < abs(heap[popIndex]) {
                if abs(heap[leftChildIndex]) == abs(heap[rightChildIndex]) {
                    return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
                }
                
                return abs(heap[leftChildIndex]) < abs(heap[rightChildIndex]) ? .left : .right
            }
            
            return abs(heap[leftChildIndex]) < abs(heap[popIndex]) ? .left : .right
        }
        
        while true {
            switch moveDown(popIndex) {
            case .left:
                let leftChildIndex = popIndex * 2
                heap.swapAt(popIndex, leftChildIndex)
                popIndex = leftChildIndex
            case .right:
                let rightChildIndex = popIndex * 2 + 1
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
var result = ""

for _ in 0..<n {
    let x = Int(readLine()!)!
    
    if x == 0 {
        result += String(heap.pop() ?? 0) + "\n"
    } else {
        heap.push(data: x)
    }
}

print(result)
