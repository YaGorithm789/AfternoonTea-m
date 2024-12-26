let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
var jewelries: [(Int, Int)] = []
var bags: [Int] = []

for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    jewelries.append((input[0], input[1]))
}

for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}

jewelries.sort { $0.0 < $1.0 }
bags.sort { $0 < $1 }
var queue = PQ<(Int, Int)>(sort: {$0.1 > $1.1 })
var result = 0
var index = 0

for bag in bags {
    while index < jewelries.count && jewelries[index].0 <= bag {
        queue.push(jewelries[index])
        index += 1
    }

    if !queue.isEmpty() {
        result += queue.pop()!.1
    }
}

print(result)

public struct PQ<T> {
    private var arr: [T] = []
    let order: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.order = sort
    }

    func isEmpty() -> Bool {
        return arr.isEmpty
    }

    mutating func push(_ element: T) {
        arr.append(element)
        bottomUp()
    }

    mutating func pop() -> T? {
        if arr.isEmpty {
            return nil
        }
        
        arr.swapAt(0, arr.count - 1)
        let last = arr.removeLast()
        topDown()

        return last
    }

    mutating func bottomUp() {
        var index = arr.count - 1
        
        while index > 0 {
            let next = (index - 1) / 2
            
            if !order(arr[index], arr[next]) {
                break
            }

            arr.swapAt(index, next)
            index = next
        }
    }

    mutating func topDown() {
        if arr.count <= 1 {
            return
        }

        var index = 0

        while 2 * index + 1 < arr.count {
            var next = 2 * index + 1

            if next < arr.count - 1 && order(arr[next + 1], arr[next]) {
                next = next + 1
            }

            if !order(arr[next], arr[index]) {
                break
            }

            arr.swapAt(index, next)
            index = next
        }
    }
}
