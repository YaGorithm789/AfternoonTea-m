let N = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = Array(repeating: 0, count: N)

loop: for i in 0..<N {
    var count = 0
    
    for j in 0..<N {
        if count == arr[i] {
            if result[j] == 0 {
                result[j] = i + 1
                break
            }
            
            continue
        }
        
        if result[j] == 0 { count += 1 }
    }
}
result.forEach { print($0, terminator: " ") }
