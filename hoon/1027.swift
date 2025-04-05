import Foundation

let n = Int(readLine()!) ?? 0
let arr: [Double] = readLine()!.split(separator: " ").map { Double(String($0))! }
var answer = 0

func findLeft(x1: Int) -> Int {
    var leftCnt = 0
    let y1 = arr[x1]
    var maxD: Double = Double(Int.max)
    
    for l in 1...x1 {
        let x2 = x1 - l
        let y2 = arr[x2]
        let d = Double(y2 - y1) / Double(x2 - x1)
        if d < maxD {
            leftCnt += 1
            maxD = d
        }
    }
    
    return leftCnt
}

func findRight(x1: Int) -> Int {
    var rightCnt = 0
    let y1 = arr[x1]
    var minD: Double = Double(Int.min)
    
    for l in x1+1..<n {
        let x2 = l
        let y2 = arr[x2]
        let d = Double(y2 - y1) / Double(x2 - x1)
        
        if d > minD {
            rightCnt += 1
            minD = d
        }
    }
    return rightCnt
}
    
for i in 0..<n {
    var left = 0
    var right = 0
    if i > 0 {
        left = findLeft(x1: i)
    }
    
    if i < n-1 {
        right = findRight(x1: i)
    }
    
    answer = max(left + right, answer)
}

print(answer)
