let n = Int(readLine()!)!
let snow = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = Int.max

for i in 0..<n - 3 {
    for j in i + 3..<n {
        var start = i + 1
        var end = j - 1
        
        while(start < end) {
            let anna = snow[i] + snow[j]
            let elsa = snow[start] + snow[end]
            let diff = elsa - anna
            
            result = min(result, abs(diff))
            
            if diff > 0 {
                end -= 1
            } else {
                start += 1
            }
        }
    }
}

print(result)
