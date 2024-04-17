import Foundation

struct MaxHeap<T: Comparable> {
    var heap = [T]()
    
    init() { }
    
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
            
            return heap[insertIndex] > heap[parentIndex] ? true : false
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
                return heap[leftChildIndex] > heap[popIndex] ? .left : .none
            }
            
            if heap[leftChildIndex] < heap[popIndex] && heap[rightChildIndex] < heap[popIndex] {
                return .none
            }
            
            if heap[leftChildIndex] > heap[popIndex] && heap[rightChildIndex] > heap[popIndex] {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            
            return heap[leftChildIndex] > heap[popIndex] ? .left : .right
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

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer{ index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }

        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }

        return sum * (isPositive ? 1 : -1)
    }
}

let file = FileIO()
let n = file.readInt()
var heap = MaxHeap<Int>()
var result = 0

for _ in 0..<n {
    for _ in 0..<n {
        let input = file.readInt()
        heap.push(data: input)
    }
}

for _ in 0..<n {
    result = heap.pop()!
}

print(result)
