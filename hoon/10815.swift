let n = Int(readLine()!)!
let na = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let ma = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""

Loop: for target in ma {
    var start = 0
    var end = n - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if target > na[mid] {
            start = mid + 1
        } else if target < na[mid] {
            end = mid - 1
        } else {
            result += "1 "
            continue Loop
        }
    }
    
    result += "0 "
}

print(result)
