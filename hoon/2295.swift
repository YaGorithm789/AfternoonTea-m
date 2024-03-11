let n = Int(readLine()!)!
var u = [Int]()
var two = [Int]()

for _ in 0..<n {
    u.append(Int(readLine()!)!)
}

u.sort()

for i in 0..<n {
    for j in i..<n {
        two.append(u[i] + u[j])
    }
}

two.sort()

Loop: for i in stride(from: n - 1, to: 0, by: -1) {
    for j in 0..<i {
        var start = 0
        var end = two.count - 1
        let target = u[i] - u[j]
        
        while start < end {
            let mid = (start + end) / 2
            
            if two[mid] < target {
                start = mid + 1
            } else if two[mid] > target {
                end = mid - 1
            } else {
                print(u[i])
                break Loop
            }
        }
    }
}
