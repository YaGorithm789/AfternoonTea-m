let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var color = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
typealias Piece = (num: Int, r: Int, c: Int, dir: Int)
var board = [[[Piece]]](repeating: [[Piece]](repeating: [Piece](), count: n), count: n)
var pieces = [Piece]()
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

for i in 0..<n {
    color[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 0..<k {
    let p = readLine()!.split(separator: " ").map { Int(String($0))! }
    let piece = (i, p[0]-1, p[1]-1, p[2]-1)
    board[p[0]-1][p[1]-1].append(piece)
    pieces.append(piece)
}

var result = 0
solve()
print(result > 1000 ? -1 : result)

func solve() {
    while true {
        result += 1
        
        for i in 0..<k {
            if move(i, pieces[i].r, pieces[i].c) >= 4 { return }
        }
        
        if result > 1000 { return }
    }
}

func check() -> Bool {
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j].count >= 4 { return true }
        }
    }
    
    return false
}

func move(_ num: Int, _ r: Int, _ c: Int) -> Int {
    let b = board[r][c]
    var idx = 0
    
    for i in 0..<b.count {
        if b[i].num == num { idx = i }
    }

    let movingPieces = b[idx...]
    var tryCnt = 0
    
    while tryCnt < 2 {
        let x = r + dx[pieces[num].dir]
        let y = c + dy[pieces[num].dir]
        
        if x < 0 || x >= n || y < 0 || y >= n || color[x][y] == 2 {
            if tryCnt == 0 { pieces[num].dir = changeDir(pieces[num].dir) }
            tryCnt += 1
        } else if color[x][y] == 1 {
            board[x][y].append(contentsOf: movingPieces.reversed())
            board[r][c].removeSubrange(idx...)
            
            for movingPiece in movingPieces {
                pieces[movingPiece.num].r = x
                pieces[movingPiece.num].c = y
            }
            
            return board[x][y].count
        } else {
            board[x][y].append(contentsOf: movingPieces)
            board[r][c].removeSubrange(idx...)
            
            for movingPiece in movingPieces {
                pieces[movingPiece.num].r = x
                pieces[movingPiece.num].c = y
            }
            
            return board[x][y].count
        }
    }
    
    return board[r][c].count
}

func changeDir(_ dir: Int) -> Int {
    switch dir {
    case 0:
        return 1
    case 1:
        return 0
    case 2:
        return 3
    case 3:
        return 2
    default:
        fatalError()
    }
}
