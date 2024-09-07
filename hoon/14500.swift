let nm = readLine()!.split(separator: " ").map{ Int($0)! }
var tetroMap = [[Int]]()

for _ in 0..<nm[0] {
    let temp = readLine()!.split(separator: " ").map { Int($0)! }
    tetroMap.append(temp)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

private func tetro_1(direction: Int, nx: Int, ny: Int) -> Int {
    var nx = nx
    var ny = ny
    var total = 0
    
    for _ in 0..<4 {
        if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
            return 0
        }
        
        total += tetroMap[nx][ny]
        nx += dx[direction]
        ny += dy[direction]
    }
    
    return total
}

private func tetro_2(direction: Int, nx: Int, ny: Int) -> Int {
    var total = 0
    
    if nx < 0 || ny < 0 || nx + 1 >= nm[0] || ny + 1 >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]
    total += tetroMap[nx + 1][ny]
    total += tetroMap[nx][ny + 1]
    total += tetroMap[nx + 1][ny + 1]
    
    return total
}

private func tetro_3(direction: Int, nx: Int, ny: Int) -> Int {
    var direction = direction
    var nx = nx
    var ny = ny
    var total = 0

    for _ in 0..<3 {
        if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
            return 0
        }
        
        total += tetroMap[nx][ny]
        nx += dx[direction]
        ny += dy[direction]
    }

    nx -= dx[direction]
    ny -= dy[direction]

    if direction == 3 {
        direction = 1
    } else if direction == 0 {
        direction = 3
    } else if direction == 2 {
        direction = 0
    } else {
        direction = 2
    }

    nx += dx[direction]
    ny += dy[direction]
    
    if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]
    
    return total
}

private func tetro_3_symmetry(direction: Int, nx: Int, ny: Int) -> Int {
    var direction = direction
    var nx = nx
    var ny = ny
    var total = 0

    for _ in 0..<3 {
        if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
            return 0
        }
        
        total += tetroMap[nx][ny]
        nx += dx[direction]
        ny += dy[direction]
    }
    
    nx -= dx[direction]
    ny -= dy[direction]

    if direction == 3 {
        direction = 0
    } else if direction == 0 {
        direction = 2
    } else if direction == 2 {
        direction = 1
    } else {
        direction = 3
    }

    nx += dx[direction]
    ny += dy[direction]
    
    if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]
    return total
}

private func tetro_4(direction: Int, nx: Int, ny: Int) -> Int {
    var direction = direction
    var nx = nx
    var ny = ny
    var total = 0

    for _ in 0..<2 {
        if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
            return 0
        }
        
        total += tetroMap[nx][ny]
        nx += dx[direction]
        ny += dy[direction]
    }
    
    nx -= dx[direction]
    ny -= dy[direction]

    if direction == 3 {
        direction = 1
    } else if direction == 0 {
        direction = 3
    } else if direction == 2 {
        direction = 0
    } else {
        direction = 2
    }
    
    nx += dx[direction]
    ny += dy[direction]
    
    if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]

    if direction == 1 {
        direction = 3
    } else if direction == 3 {
        direction = 0
    } else if direction == 0 {
        direction = 2
    } else {
        direction = 1
    }
    
    nx += dx[direction]
    ny += dy[direction]
    
    if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]
    return total
}

private func tetro_4_symmetry(direction: Int, nx: Int, ny: Int) -> Int {
    var direction = direction
    var nx = nx
    var ny = ny
    var total = 0

    for _ in 0..<2 {
        if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
            return 0
        }
        
        total += tetroMap[nx][ny]
        nx += dx[direction]
        ny += dy[direction]
    }
    
    nx -= dx[direction]
    ny -= dy[direction]

    if direction == 3 {
        direction = 0
    } else if direction == 0 {
        direction = 2
    } else if direction == 2 {
        direction = 1
    } else {
        direction = 3
    }
    
    nx += dx[direction]
    ny += dy[direction]
    
    if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]

    if direction == 0 {
        direction = 3
    } else if direction == 2 {
        direction = 0
    } else if direction == 1 {
        direction = 2
    } else {
        direction = 3
    }
    
    nx += dx[direction]
    ny += dy[direction]
    
    if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]
    
    return total
}

private func tetro_5(direction: Int, nx: Int, ny: Int) -> Int {
    var direction = direction
    var nx = nx
    var ny = ny
    var total = 0

    for _ in 0..<3 {
        if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
            return 0
        }
        
        total += tetroMap[nx][ny]
        nx += dx[direction]
        ny += dy[direction]
    }
    
    nx = nx - dx[direction] - dx[direction]
    ny = ny - dy[direction] - dy[direction]

    if direction == 3 {
        direction = 1
    } else if direction == 0 {
        direction = 3
    } else if direction == 2 {
        direction = 0
    } else {
        direction = 2
    }
    
    nx += dx[direction]
    ny += dy[direction]
    
    if nx < 0 || ny < 0 || nx >= nm[0] || ny >= nm[1] {
        return 0
    }
    
    total += tetroMap[nx][ny]
    
    return total
}

var direction = 0
var answer = [Int]()

for i in 0..<nm[0] {
    for j in 0..<nm[1] {
        for k in 0..<4 {
            answer.append(tetro_1(direction: k, nx: i, ny: j))
            answer.append(tetro_2(direction: k, nx: i, ny: j))
            answer.append(tetro_3(direction: k, nx: i, ny: j))
            answer.append(tetro_3_symmetry(direction: k, nx: i, ny: j))
            answer.append(tetro_4(direction: k, nx: i, ny: j))
            answer.append(tetro_4_symmetry(direction: k, nx: i, ny: j))
            answer.append(tetro_5(direction: k, nx: i, ny: j))
        }
    }
}

print(answer.max()!)
