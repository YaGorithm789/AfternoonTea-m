let n = Int(String(readLine()!))!
let k = Int(String(readLine()!))!
var start = 1
var end = n * n

while start <= end {
    let mid = (start + end) / 2
    var count = 0
    
    for i in 1...n {
        count += min(mid / i, n)
    }
    
    if count >= k {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(start)
