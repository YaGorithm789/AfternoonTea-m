let input = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (input[0], input[1])
var board = [[Character]]()
let dir = [(-1, 0), (0, -1), (1, 0), (0, 1)]
var fire = Array(repeating: Array(repeating: -1, count: c), count: r)
var person = Array(repeating: Array(repeating: -1, count: c), count: r)
var q1 = [(Int, Int)]()
var q2 = [(Int, Int)]()
var result = -1
var pointer = 0

for i in 0..<r {
    board.append(Array(readLine()!))
    
    for j in 0..<c {
        if board[i][j] == "F" {
            q1.append((i, j))
            fire[i][j] = 0
        } else if board[i][j] == "J" {
            q2.append((i, j))
            person[i][j] = 0
        }
    }
}

while q1.count > pointer {
    let (x, y) = q1[pointer]
    pointer += 1
    
    for (dx, dy) in dir {
        guard 0..<r ~= x + dx,
              0..<c ~= y + dy,
              board[x + dx][y + dy] != "#",
              fire[x + dx][y + dy] == -1
        else { continue }
        
        q1.append((x + dx, y + dy))
        fire[x + dx][y + dy] = fire[x][y] + 1
    }
}

pointer = 0
Loop: while q2.count > pointer {
    let (x, y) = q2[pointer]
    pointer += 1
    
    for (dx, dy) in dir {
        guard 0..<r ~= x + dx,
              0..<c ~= y + dy
        else {
            result = person[x][y] + 1
            break Loop
        }
        guard board[x + dx][y + dy] != "#",
              person[x + dx][y + dy] == -1,
              fire[x + dx][y + dy] == -1 || fire[x + dx][y + dy] > person[x][y] + 1
        else { continue }
        
        q2.append((x + dx, y + dy))
        person[x + dx][y + dy] = person[x][y] + 1
    }
}

print(result == -1 ? "IMPOSSIBLE" : result)
