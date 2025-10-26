import Foundation

func readInts() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

let nm = readInts()
let (n, m) = (nm[0], nm[1])
var box: [[Int]] = []
var colorCountPerBox = [Int](repeating: 0, count: n)
var singleColorIndex = [Int](repeating: -1, count: n)

for _ in 0..<n {
    box.append(readInts())
}

for i in 0..<n {
    var cnt = 0
    var idx = -1
    
    for c in 0..<m {
        if box[i][c] > 0 {
            cnt += 1
            idx = c
        }
    }
    
    colorCountPerBox[i] = cnt
    singleColorIndex[i] = (cnt == 1 ? idx : -1)
}

var answer = Int.max

for joker in 0..<n {
    var moves = 0
    var singleColorBoxes = [Int](repeating: 0, count: m)
    
    for i in 0..<n {
        if i == joker { continue }
        let cnt = colorCountPerBox[i]
        if cnt == 0 {
            continue
        } else if cnt >= 2 {
            moves += 1
        } else {
            let c = singleColorIndex[i]
            if c >= 0 { singleColorBoxes[c] += 1 }
        }
    }
    
    for c in 0..<m {
        if singleColorBoxes[c] >= 2 {
            moves += (singleColorBoxes[c] - 1)
        }
    }
    
    answer = min(answer, moves)
}

print(answer)
