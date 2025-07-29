import Foundation

let rect = readLine()!.split(separator:" ").map { Int($0)! }
let height = rect[0]
let width = rect[1]
var map = Array(repeating: [String](), count: height)
var res = -1

for i in 0..<height {
    map[i] = readLine()!.map { String($0) }
}

for y in 0..<height {
    for x in 0..<width {
        for dy in (-(height - 1))..<height {
            for dx in (-(width - 1))..<width {
                var curX = x
                var curY = y
                var sum = 0
                var strSum = ""

                while (curX >= 0 && curX < width) && ( curY >= 0 && curY < height) {
                    strSum += map[curY][curX]
                    sum = Int(strSum)!
                    var sqrtNum = Int(sqrt(Double(sum)))

                    if sqrtNum * sqrtNum == sum {
                        res = max(res, sum)
                    }

                    if dx == 0 && dy == 0 {
                        break
                    }

                    curX = curX + dx
                    curY = curY + dy
                }
            }
        }
    }
}

print(res)
