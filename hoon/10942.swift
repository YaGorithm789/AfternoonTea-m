import Foundation

// Swift 입출력
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

// 입력
let fileIO = FileIO()
let N = fileIO.readInt()
var arr = [Int]()
for i in 0..<N {
    arr.append(fileIO.readInt())
}
let M = fileIO.readInt()
var dp = Array(repeating: Array(repeating: 0, count: N), count: N)

// 수열의 길이가 1일때
for i in 0..<N {
    dp[i][i] = 1
}

// 수열의 길이가 2일때
for i in 0..<N-1 {
    if arr[i] == arr[i+1] {
        dp[i][i+1] = 1
    }
}

// 수열의 길이가 3이상일때
for i in (0..<N-2).reversed() {
    for j in (i+2..<N).reversed() {
        let idx = j
        if arr[i] == arr[idx] && dp[i+1][idx-1] == 1 {
            dp[i][idx] = 1
        }
    }
}
var answer = ""
for i in 0..<M {
    let s1 = fileIO.readInt()
    let s2 = fileIO.readInt()
    answer += "\(dp[s1-1][s2-1])\n"
}

print(answer)
