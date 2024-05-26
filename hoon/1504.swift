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

let ne = readLine()!.split(separator: " ").map { Int($0)! }
let n = ne[0], e = ne[1]
var adj = Array(repeating: [(c: Int, v: Int)](), count: n + 1)
var result = 0
let INF = 0x3f3f3f3f

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let a = abc[0], b = abc[1], c = abc[2]
    
    adj[a].append((c, b))
    adj[b].append((c, a))
}

let input = readLine()!.split(separator: " ").map { Int($0)! }

func dijkstra(start: Int, end: Int) -> Int {
    var heap = Heap<(c: Int, v: Int)>(comparer: <)
    var d = Array(repeating: INF, count: n + 1)
    d[start] = 0
    heap.insert(element: (d[start], start))

    while let cur = heap.pop() {
        if d[cur.v] != cur.c { continue }

        for next in adj[cur.v] {
            if d[next.v] <= d[cur.v] + next.c { continue }

            d[next.v] = d[cur.v] + next.c
            heap.insert(element: (d[next.v], next.v))
        }
    }

    return d[end]
}

result += min(
    dijkstra(start: 1, end: input[0]) + dijkstra(start: input[1], end: n),
    dijkstra(start: 1, end: input[1]) + dijkstra(start: input[0], end: n)
)

result += dijkstra(start: input[0], end: input[1])

print(result >= INF ? -1 : result)
