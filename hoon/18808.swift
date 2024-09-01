func rotateSticker(rn: Int, rm: Int, _sticker: [[Int]]) -> [[Int]] {
    var tmpBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    var sticker: [[Int]] = _sticker

    for i in 0..<rn {
        for j in 0..<rm {
            tmpBoard[i][j] = sticker[i][j]
        }
    }

    sticker = Array(repeating: Array(repeating: 0, count: rn), count: rm)

    for i in 0..<rm {
        for j in 0..<rn {
            sticker[i][j] = tmpBoard[rn - 1 - j][i]
        }
    }

    return sticker
}

func putSticker(si: Int, sj: Int, testSticker: [[Int]]) -> Bool {
    var isAvailable = false

    for i in 0..<n {
        for j in 0..<m {
            isAvailable = true

            for k in i..<i + si {
                if i + si > n {
                    isAvailable = false
                    break
                }
                
                for l in j..<j + sj {
                    if j + sj > m {
                        isAvailable = false
                        break
                    }

                    if testBoard[k][l] + testSticker[k - i][l - j] == 2 {
                        isAvailable = false
                        break
                    } else {
                        testBoard[k][l] += testSticker[k - i][l - j]
                    }
                }
                
                if !isAvailable {
                    testBoard = board
                    break
                }
            }
            
            if isAvailable {
                board = testBoard
                return isAvailable
            }
        }
    }

    return isAvailable
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])
var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
var testBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0..<k {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (si, sj) = (info[0], info[1])
    var sticker: [[Int]] = []

    for _ in 0..<si {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        sticker.append(line)
    }

    for _ in 0..<4 {
        let success = putSticker(si: si, sj: sj, testSticker: sticker)
        
        if success {
            break
        } else {
            sticker = rotateSticker(rn: si, rm: sj, _sticker: sticker)
            swap(&si, &sj)
        }
    }
}

var answer: Int = 0

for i in 0..<n {
    for j in 0..<m {
        answer += board[i][j]
    }
}

print(answer)
