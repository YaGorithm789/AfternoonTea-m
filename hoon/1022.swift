import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r1 = input[0]
let r2 = input[2]
let c1 = input[1]
let c2 = input[3]
var map = Array(repeating: Array(repeating: 0, count: c2 - c1 + 1), count: r2 - r1 + 1)
var maxValue = 0

func fill() {
    let dx = [0, -1, 0, 1]
    let dy = [1, 0, -1, 0]
    var dIndex = 0
    var x = 0
    var y = 0
    var currentNum = 1
    var countForTurn = 1
    var moveCount = 0

    while map[0][0] == 0 || map[r2 - r1][0] == 0 || map[0][c2 - c1] == 0 || map[r2 - r1][c2 - c1] == 0 {
        if x >= r1, x <= r2, y >= c1, y <= c2 {
            map[x - r1][y - c1] = currentNum
        }

        currentNum += 1
        moveCount += 1
        x = x + dx[dIndex]
        y = y + dy[dIndex]

        if moveCount == countForTurn {
            moveCount = 0
            if dIndex == 1 || dIndex == 3 {
                countForTurn += 1
            }
            dIndex = (dIndex + 1) % 4
        }
    }

    maxValue = currentNum - 1 // 가장 큰 수 저장 (가장 큰 수의 길이)
}

func printResult() {
    let strLen = String(maxValue).count
    
    for i in 0..<r2 - r1 + 1 {
        for j in 0..<c2 - c1 + 1 {
            print(String(format: "%\(strLen)d", map[i][j]), terminator: " ")
        }
        
        print()
    }
}

fill()
printResult()
