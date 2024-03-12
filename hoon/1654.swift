let kn = readLine()!.split(separator: " ").map { Int($0)! }
let (k, n) = (kn[0], kn[1])
var length = [Int]()

for _ in 0..<k {
    length.append(Int(readLine()!)!)
}

var start = 1
var end = length.max()!

func solve(x: Int) -> Bool {
    var sum = 0
    
    for i in 0..<k {
        sum += length[i] / x
    }
    
    return sum >= n
}

while start < end {
    let mid = (start + end + 1) / 2
    
    if solve(x: mid) {
        start = mid
    } else {
        end = mid - 1
    }
}

print(start)
