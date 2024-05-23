struct Heap<T> {
    private var elements: [T] = []
    private let comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return elements.count <= 1
    }
    
    var top: T? {
        return isEmpty ? nil : elements[1]
    }
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func insert(element: T) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        elements.append(element)
        swimUp(index: elements.count - 1)
    }
    
    mutating private func swimUp(index: Int) {
        var index = index
        while index > 1 && comparer(elements[index], elements[index / 2]) {
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }
    
    mutating func pop() -> T? {
        if elements.count < 2 { return nil }
        elements.swapAt(1, elements.count - 1)
        let deletedElement = elements.removeLast()
        diveDown(index: 1)
        return deletedElement
    }
    
    mutating private func diveDown(index: Int) {
        var swapIndex = index
        var isSwap = false
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1

        if leftIndex < elements.endIndex && comparer(elements[leftIndex], elements[swapIndex]) {
            swapIndex = leftIndex
            isSwap = true
        }
        
        if rightIndex < elements.endIndex && comparer(elements[rightIndex], elements[swapIndex]) {
            swapIndex = rightIndex
            isSwap = true
        }

        if isSwap {
            elements.swapAt(swapIndex, index)
            diveDown(index: swapIndex)
        }
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let INF = 1234567890
var adj = Array(repeating: [(w: Int, v: Int)](), count: n + 1)
var d = Array(repeating: INF, count: n + 1)
var pre = Array(repeating: INF, count: n + 1)

for _ in 0..<m {
    let uvw = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uvw[0], v = uvw[1], w = uvw[2]
    
    adj[u].append((w, v))
}

var input = readLine()!.split(separator: " ").map { Int($0)! }
let st = input[0], des = input[1]
d[st] = 0

var heap = Heap<(w: Int, v: Int)>(comparer: <)
heap.insert(element: (d[st], st))

while heap.isEmpty == false {
    let cur = heap.pop()!
    if d[cur.v] != cur.w { continue }
    
    for next in adj[cur.v] {
        if d[next.v] <= d[cur.v] + next.w { continue }
        
        d[next.v] = d[cur.v] + next.w
        heap.insert(element: (d[next.v], next.v))
        pre[next.v] = cur.v
    }
}

print(d[des])

var path = [Int]()
var cur = des

while cur != st {
    path.append(cur)
    cur = pre[cur]
}

path.append(cur)

print(path.count)
print(path.reversed().map(String.init).joined(separator: " "))
