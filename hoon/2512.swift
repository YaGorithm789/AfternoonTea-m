let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!
var answer = 0

func binarySearch(l: Int, r: Int) {
    let mid = (l + r) / 2
    
    if mid == l || mid == r {
        return
    }
    
    var total = 0
    
    for a in arr {
        if a > mid {
            total += mid
        } else {
            total += a
        }
    }
    
    if total > m {
        binarySearch(l: l, r: mid)
    } else {
        answer = max(answer, mid)
        binarySearch(l: mid, r: r)
    }
}

if arr.reduce(0, +) <= m {
    answer = arr.max()!
} else {
    binarySearch(l: 0, r: arr.max()!)
}

print(answer)
