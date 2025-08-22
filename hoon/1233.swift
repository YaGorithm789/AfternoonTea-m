import Foundation

let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
let s1 = nums[0], s2 = nums[1], s3 = nums[2]
var counts = Array(repeating: 0, count: s1 + s2 + s3 + 1)

for a in 1...s1 {
    for b in 1...s2 {
        for c in 1...s3 {
            counts[a + b + c] += 1
        }
    }
}

var bestSum = 3
var bestCnt = counts[3]

for sum in 4...(s1 + s2 + s3) {
    let cnt = counts[sum]
    
    if cnt > bestCnt {
        bestCnt = cnt
        bestSum = sum
    }
}

print(bestSum)
