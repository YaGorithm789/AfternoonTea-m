func solve() -> Int {
    var N = Int(readLine()!)!
    var crane = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)
    var M = Int(readLine()!)!
    var box = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)
    var answer = 0

    if box[0] > crane[0] {
        return -1
    }

    while !box.isEmpty {
        answer += 1
        
        for i in 0..<crane.count {
            for j in 0..<box.count {
                if crane[i] >= box[j] {
                    box.remove(at: j)
                    break
                }
            }
        }
    }
    
    return answer
}

print(solve())
