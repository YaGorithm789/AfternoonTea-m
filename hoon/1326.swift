import Foundation

// 입력
let N = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let AB = readLine()!.split(separator: " ").map { Int($0)! }
let a = AB[0], b = AB[1]

// 1-index를 위해 앞에 0 하나 추가
var A = [0] + nums

// BFS
var dist = Array(repeating: -1, count: N + 1)
var queue: [Int] = []
var head = 0

dist[a] = 0
queue.append(a)

while head < queue.count {
    let cur = queue[head]; head += 1
    let step = A[cur]
    
    // 오른쪽으로 이동: cur + step, cur + 2*step, ...
    var next = cur + step
    while next <= N {
        if dist[next] == -1 {
            dist[next] = dist[cur] + 1
            if next == b { print(dist[next]); exit(0) }
            queue.append(next)
        }
        next += step
    }
    
    // 왼쪽으로 이동: cur - step, cur - 2*step, ...
    next = cur - step
    while next >= 1 {
        if dist[next] == -1 {
            dist[next] = dist[cur] + 1
            if next == b { print(dist[next]); exit(0) }
            queue.append(next)
        }
        next -= step
    }
}

// 도달 불가 시 -1
print(dist[b])
