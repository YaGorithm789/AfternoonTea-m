let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

for i in arr {
    var flag = true
    
    if i == 1 {
        continue
    }
    
    for j in 2..<i {
        if i % j == 0 {
            flag = false
        }
    }
    
    if flag {
        result += 1
    }
}

print(result)
