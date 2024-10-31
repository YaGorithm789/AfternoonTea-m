let N = Int(readLine()!)!
var A = readLine()!.split(separator:" ").map { Int($0)! }
A.sort()
var count = 0

for i in 0...N - 1 {
    let find = A[i]
    var start = 0
    var end = N - 1
    
    while start < end {
        if A[start] + A[end] == find {
            if start != i && end != i {
                count = count + 1
                break
            } else if start == i {
                start = start + 1
            } else if end == i {
                end = end - 1
            }
        } else if A[start] + A[end] < find {
            start = start + 1
        } else {
            end = end - 1
        }
    }
}

print(count)
