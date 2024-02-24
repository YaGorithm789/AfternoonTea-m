let n = Int(readLine()!)!
var times = [(start: Int, end: Int)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0], end = input[1]
    times.append((start, end))
}

times.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }

var t = 0
var answer = 0

for time in times {
    if t > time.start { continue }
    
    t = time.end
    answer += 1
}

print(answer)
