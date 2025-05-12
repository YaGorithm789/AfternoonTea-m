import Foundation

func from2DTo1D(_ r: Int, _ c: Int) -> Int {
    return 3 * r + c
}

func from1DTo2D(_ idx: Int) -> (Int, Int) {
    return (idx / 3, idx % 3)
}

func strSwap(_ left: Int, _ right: Int, _ text: String) -> String {
    var textArray = Array(text)
    textArray.swapAt(left, right)
    
    return String(textArray)
}

var visited = Set<String>()
let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]
var board: [String] = []

for _ in 0..<3 {
    let line = readLine()!
    board += line.components(separatedBy: " ")
}

let zeroIdx = board.firstIndex(of: "0")!
let initState = (board.joined(), zeroIdx)

func bfs(_ startState: (String, Int)) -> Int {
    var q = [(startState, 0)]
    var index = 0
    visited.insert(startState.0)

    while index < q.count {
        let (state, depth) = q[index]
        index += 1

        if state.0 == "123456780" {
            return depth
        }

        let (r, c) = from1DTo2D(state.1)

        for i in 0..<4 {
            let nr = r + dr[i]
            let nc = c + dc[i]

            if nr < 0 || nr > 2 || nc < 0 || nc > 2 {
                continue
            }

            let nextIdx = from2DTo1D(nr, nc)
            let nextStateStr = strSwap(state.1, nextIdx, state.0)
            let nextState = (nextStateStr, nextIdx)

            if visited.contains(nextState.0) {
                continue
            }

            q.append((nextState, depth + 1))
            visited.insert(nextState.0)
        }
    }
    
    return -1
}

print(bfs(initState))
