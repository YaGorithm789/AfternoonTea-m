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

let nmx = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmx[0], m = nmx[1], x = nmx[2]
var adj = Array(repeating: [(c: Int, v: Int)](), count: n + 1)
var cost = Array(repeating: 0, count: n + 1)

for _ in 0..<m {
    let uvc = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uvc[0], v = uvc[1], c = uvc[2]
    
    adj[u].append((c, v))
}

func dijkstra(start: Int, end: Int) -> Int {
    var heap = Heap<(c: Int, v: Int)>(comparer: <)
    var d = Array(repeating: Int.max, count: n + 1)
    d[start] = 0
    heap.insert(element: (d[start], start))

    while heap.isEmpty == false {
        let cur = heap.pop()!
        if d[cur.v] != cur.c { continue }

        for next in adj[cur.v] {
            if d[next.v] <= d[cur.v] + next.c { continue }

            d[next.v] = d[cur.v] + next.c
            heap.insert(element: (d[next.v], next.v))
        }
    }
    
    return d[end]
}


for i in 1...n {
    cost[i] += dijkstra(start: i, end: x)
    cost[i] += dijkstra(start: x, end: i)
}

print(cost.max()!)
