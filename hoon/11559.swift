enum BombState {
    case beingBomb, failure, none
}

var arr = [[Character]]()
let row = 12, col = 6

for _ in 0..<row  {
    let q: [Character] = Array(readLine()!)
    arr.append(q)
}

let dir = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var beingBombArr: [[BombState]] = Array(repeating: Array(repeating: .none, count: col), count: row)

func checkWillBeBomb() {
    for i in 0..<row {
        for j in 0..<col {
            if beingBombArr[i][j] != .none || arr[i][j] == "." { continue }
            
            if bfs((i, j), .beingBomb) < 4 {
                bfs((i, j), .failure)
            }
        }
    }
}

func bfs(_ start: (Int, Int), _ state: BombState) -> Int  {
    let target = arr[start.0][start.1]
    beingBombArr[start.0][start.1] = state
    var count = 1
    var queue = [(start)], q = 0
    
    while queue.count > q {
        let f = queue[q]
        q += 1
        
        for k in 0..<4 {
            let n = (f.0 + dir[k].0, f.1 + dir[k].1)
            if n.0 >= row || n.1 >= col || n.0 < 0 || n.1 < 0 { continue }
            if state == .beingBomb && beingBombArr[n.0][n.1] == .beingBomb { continue }
            if state == .failure && beingBombArr[n.0][n.1] == .failure { continue }
            if arr[n.0][n.1] != target { continue }
            
            count += 1
            beingBombArr[n.0][n.1] = state
            queue.append(n)
        }
    }
    
    return count
}

func removeBeingBomb() -> Bool  {
    var isBomb = false
    
    for i in 0..<row {
        for j in 0..<col {
            if beingBombArr[i][j] == .beingBomb {
                isBomb = true
                arr[i][j] = "."
            }
        }
    }
    
    beingBombArr = Array(repeating: Array(repeating: .none, count: col), count: row)
    
    return isBomb
}

func shift() {
    for i in (0..<col) {
        for j in (1..<row).reversed() {
            if arr[j][i] != "." { continue }
            
            var k = j - 1
            
            while k >= 0 {
                if arr[k][i] == "." { 
                    k -= 1
                    continue
                }
                
                arr[j][i] = arr[k][i]
                arr[k][i] = "."
                break
            }
        }
    }
}

var ans = 0
checkWillBeBomb()

while removeBeingBomb() {
    ans += 1
    shift()
    checkWillBeBomb()
}

print(ans)
