let n = Int(readLine()!)!
let na = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let ma = readLine()!.split(separator: " ").map { Int($0)! }

Loop: for target in ma {
    var start = 0
    var end = n - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if na[mid] < target {
            start = mid + 1
        } else if na[mid] > target {
            end = mid - 1
        } else {
            print(1)
            continue Loop
        }
    }
    
    print(0)
}
