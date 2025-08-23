import Foundation

// 빠른 입력
final class FastScanner {
    private var data: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0]
    private var idx: Int = 0
    
    @inline(__always) private func skipWhitespaces() {
        while data[idx] == 10 || data[idx] == 13 || data[idx] == 32 { idx += 1 } // \n \r space
    }
    @inline(__always) func readInt() -> Int {
        skipWhitespaces()
        var sign = 1
        var num = 0
        if data[idx] == 45 { sign = -1; idx += 1 } // '-'
        while data[idx] >= 48 {
            num = num * 10 + Int(data[idx] - 48)
            idx += 1
        }
        return num * sign
    }
}

let sc = FastScanner()
let N = sc.readInt()
var A = [Int](repeating: 0, count: N + 1)
for i in 1...N { A[i] = sc.readInt() }
let a = sc.readInt()
let b = sc.readInt()

// BFS
var dist = [Int](repeating: -1, count: N + 1)
var queue = [Int]()
var head = 0

dist[a] = 0
queue.append(a)

while head < queue.count {
    let cur = queue[head]; head += 1
    let step = A[cur]
    
    // 오른쪽으로 step 배수만큼
    var nxt = cur + step
    while nxt <= N {
        if dist[nxt] == -1 {
            dist[nxt] = dist[cur] + 1
            if nxt == b { print(dist[nxt]); exit(0) }
            queue.append(nxt)
        }
        nxt += step
    }
    // 왼쪽으로 step 배수만큼
    nxt = cur - step
    while nxt >= 1 {
        if dist[nxt] == -1 {
            dist[nxt] = dist[cur] + 1
            if nxt == b { print(dist[nxt]); exit(0) }
            queue.append(nxt)
        }
        nxt -= step
    }
}

print(dist[b]) // 도달 불가 시 -1
