import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1 : -1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let fileIO = FileIO()
let t = fileIO.readInt()

for _ in 0..<t {
    let n = fileIO.readInt()
    let k = fileIO.readInt()
    var ds = [Int]()
    
    for _ in 0..<n {
        ds.append(fileIO.readInt())
    }
    
    var graph = Array(repeating: [Int](), count: n + 1)
    var count = Array(repeating: 0, count: n + 1)
    
    for _ in 0..<k {
        let x = fileIO.readInt()
        let y = fileIO.readInt()
        graph[x].append(y)
        count[y] += 1
    }
    
    let w = fileIO.readInt()
    var dp = Array(repeating: 0, count: n + 1)
    var queue = [Int]()
    
    for i in 1...n {
        if count[i] == 0 {
            queue.append(i)
            dp[i] = ds[i - 1]
        }
    }
    
    var idx = 0
    
    while idx < queue.count {
        let current = queue[idx]
        idx += 1
        
        for next in graph[current] {
            dp[next] = max(dp[next], dp[current] + ds[next - 1])
            count[next] -= 1
            
            if count[next] == 0 {
                queue.append(next)
            }
        }
    }
    
    print(dp[w])
}
