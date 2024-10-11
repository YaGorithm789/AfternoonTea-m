let n = Int(readLine()!)!
var lecture = [(Int, Bool)]()
var current = 0
var answer = 0

for _ in 0..<n {
    let st = readLine()!.split(separator: " ").map { Int(String($0))! }
    lecture.append((st[0], true))
    lecture.append((st[1], false))
}

lecture.sort {
    if $0.0 != $1.0 {
        return $0.0 < $1.0
    } else {
        return !$0.1
    }
}

for o in lecture {
    if o.1 {
        current += 1
        answer = max(current, answer)
    } else {
        current -= 1
    }
}

print(answer)
