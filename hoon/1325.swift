struct Queue<T> {
    var pushStack = [T]()
    var popStack = [T]()
    
    var isEmpty: Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
    
    var count: Int {
        return pushStack.count + popStack.count
    }
    
    mutating func enqueue(_ element: T) {
        pushStack.append(element)
    }
    
    mutating func dequeue() -> T? {
        if popStack.isEmpty {
            while let popped = pushStack.popLast() {
                popStack.append(popped)
            }
        }
        
        return popStack.popLast()
    }
}

func answer() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    var adj = Array(repeating: [Int](), count: n + 1)
    var maxHack = -1
    var result = Array(repeating: 0, count: n + 1)
    
    for _ in 0..<m {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        let u = uv[0], v = uv[1]
        adj[v].append(u)
    }
    
    for i in 1...n {
        var visited = Array(repeating: false, count: n + 1)
        var queue = Queue<Int>()
        visited[i] = true
        queue.enqueue(i)
        
        while let cur = queue.dequeue() {
            for j in adj[cur] {
                if !visited[j] {
                    queue.enqueue(j)
                    result[i] += 1
                    visited[j] = true
                }
            }
        }
        
        maxHack = max(maxHack, Int(result[i]))
    }
    
    var ans = ""
    
    for i in 1...n where result[i] == maxHack {
        ans += String(i) + " "
    }
    
    print(ans)
}

answer()
