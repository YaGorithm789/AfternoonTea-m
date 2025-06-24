let N = Int(readLine()!)!
var times: [(Int, Bool)] = []
var count = 0
var maxCount = 1

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    times.append((input[1], true))
    times.append((input[2], false))
}

times.sort(by: { $0.0 == $1.0 ? !$0.1 && $1.1 : $0.0 < $1.0 })

for (_, isStart) in times {
    if isStart {
        count += 1
    } else {
        count -= 1
    }
    
    maxCount = max(count, maxCount)
}

print(maxCount)
