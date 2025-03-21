let N = Int(readLine()!)!
let K = Int(readLine()!)!
let coordis = Array(Set(readLine()!.split(separator: " ").map { Int($0)! })).sorted()

if K >= N {
    print(0)
} else {
    var gaps: [Int] = []
  
    for i in 0..<coordis.count-1 {
        gaps.append(abs(coordis[i]-coordis[i+1]))
    }
  
    print(gaps.sorted(by: >)[(K-1)...].reduce(0, +))
}
