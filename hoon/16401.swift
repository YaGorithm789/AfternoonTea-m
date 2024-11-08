let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
var nephews = readLine()!.split(separator: " ").map { Int($0)! }
nephews.sort()
var (left, right, ans) = (1, nephews.reduce(0, { max($0, $1) }), 0)

while left <= right {
    let mid = (left + right) / 2
    var count = 0
    
    for nephew in nephews {
        count += nephew / mid
    }

    if count >= m {
        ans = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(ans)
