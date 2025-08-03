let input = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y) = (input[0], input[1])
let z = y * 100 / x
var start = 0
var end = x
var result = -1

while start <= end {
    let mid = (start + end) / 2
    let nx = x + mid
    let ny = y + mid
    let nz = ny * 100 / nx
    
    if z < nz {
        result = mid
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(result)
