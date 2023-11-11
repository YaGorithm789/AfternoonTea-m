var remain = Set<Int>()

(1...10).forEach { _ in
    let input = Int(readLine()!)!
    remain.insert(input % 42)
}

print(remain.count)
