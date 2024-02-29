let t = Int(readLine()!)!

for _ in 1...t {
    let n = Int(readLine()!)!
    let stock = readLine()!.split(separator: " ").map { Int($0)! }
    var answer = 0
    var high = 0
    
    for i in (0..<n).reversed() {
        if high < stock[i] {
            high = stock[i]
        } else {
            answer += high - stock[i]
        }
    }
    
    print(answer)
}
