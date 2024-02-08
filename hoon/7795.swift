let t = Int(readLine()!)!

for _ in 1...t {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let m = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    var result = 0
        
    for i in n {
        for j in m {
            if i > j {
                result += 1
            } else {
                break
            }
        }
    }
    
    print(result)
}
