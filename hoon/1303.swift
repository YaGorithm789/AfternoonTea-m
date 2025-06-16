import Foundation

let n = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (n[0], n[1])
let dx: [Int] = [1, -1, 0, 0]
let dy: [Int] = [0, 0, 1, -1]
var countBlue = 0
var countWhite = 0
var arr: [[Character]] = Array(repeating: Array(repeating: " ", count: N + 2), count: M + 2)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N + 2), count: M + 2)

for i in 1...M {
    arr[i][1...N] = ArraySlice(readLine()!)
}

func countSoldier(_ team: Character, _ x: Int, _ y: Int, _ count: inout Int) -> Int {
    visited[x][y] = true
    
    guard arr[x][y] == team else { return count }
    
    for i in 0...3 {
        if arr[x + dx[i]][y + dy[i]] == team && !visited[x + dx[i]][y + dy[i]]{
            count += 1
            countSoldier(team, x + dx[i], y + dy[i], &count)
        }
    }
    
    return count
}

for i in 1...M {
    for j in 1...N {
        if !visited[i][j] {
            var count = 1
            let num = Int(pow(Double(countSoldier(arr[i][j], i, j, &count)), Double(2)))
            
            if arr[i][j] == "B" {
                countBlue += num
            } else {
                countWhite += num
            }
        }
    }
}

print(countWhite, countBlue)
