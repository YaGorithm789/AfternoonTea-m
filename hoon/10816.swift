let n = Int(readLine()!)!
let na = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let ma = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""

func lower(target: Int, length: Int) -> Int {
    var start = 0
    var end = length
    
    while start < end {
        let mid = (start + end) / 2
        
        if na[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    return start
}

func upper(target: Int, length: Int) -> Int {
    var start = 0
    var end = length
    
    while start < end {
        let mid = (start + end) / 2
        
        if na[mid] > target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    return start
}

for target in ma {
    result += String(upper(target: target, length: n) - lower(target: target, length: n)) + " "
}

print(result)
