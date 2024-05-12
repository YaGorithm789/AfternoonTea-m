let t = Int(readLine()!)!
var result = 0

for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    
    for _ in 0..<m {
        _ = readLine()
    }
    
    print(n - 1)
}
