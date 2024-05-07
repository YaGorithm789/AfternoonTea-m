let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var adj = Array(repeating: Set<Int>(), count: n + 1)
var deg = Array(repeating: 0, count: n + 1)
var queue = [Int]()
var result = [Int]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let num = input[0], arr = input[1...]
    
    if num < 2 {
        continue
    }
    
    for i in 2...num {
        deg[arr[i - 1]] += adj[arr[i]].insert(arr[i - 1]).inserted ? 1 : 0
    }
}

for i in 1...n {
    if deg[i] == 0 { queue.append(i) }
}

while queue.isEmpty == false {
    let cur = queue.removeFirst()
    result.append(cur)

    for next in adj[cur] {
        deg[next] -= 1

        if deg[next] == 0 { queue.append(next) }
    }
}

if result.count != n {
    print(0)
} else {
    result.reversed().forEach {
        print($0)
    }
}
