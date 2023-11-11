let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let (before, after) = (input[0], input[1])
    
    if before.count != after.count {
        print("Impossible")
        continue
    }
    
    var alpha = [Int](repeating: 0, count: 26)
    
    for (i, j) in zip(before, after) {
        alpha[Int(UnicodeScalar(String(i))!.value) - 97] += 1
        alpha[Int(UnicodeScalar(String(j))!.value) - 97] -= 1
    }
    
    print(alpha.reduce(0) { $0 + abs($1) } == 0 ? "Possible" : "Impossible")
}
