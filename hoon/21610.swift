func isWithinMap(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < n
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var map = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(input)
}

var clouds = [(n - 1, 0), (n - 1, 1), (n - 2, 0), (n - 2, 1)]
let dx = [0, 0, -1, -1, -1, 0, 1, 1, 1]
let dy = [0, -1, -1, 0, 1, 1, 1, 0, -1]

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (d, s) = (input[0], input[1])
    var cloudsMoved = [(Int, Int)]()
    
    for (x, y) in clouds {
        var nx = (x + dx[d] * s) % n
        var ny = (y + dy[d] * s) % n
        
        if nx < 0 { nx += n }
        if ny < 0 { ny += n }
        
        cloudsMoved.append((nx, ny))
    }
    
    for (x, y) in cloudsMoved {
        map[x][y] += 1
    }
    
    for (x, y) in cloudsMoved {
        var count = 0
        
        for i in stride(from: 2, through: 8, by: 2) {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if isWithinMap(nx, ny) && map[nx][ny] > 0 {
                count += 1
            }
        }
        
        map[x][y] += count
    }
    
    var newClouds = [(Int, Int)]()
    
    for x in 0..<n {
        for y in 0..<n {
            if map[x][y] >= 2 && !cloudsMoved.contains(where: { $0 == (x, y) }) {
                map[x][y] -= 2
                newClouds.append((x, y))
            }
        }
    }
    
    clouds = newClouds
}

var sum = 0

for x in 0..<n {
    for y in 0..<n {
        sum += map[x][y]
    }
}

print(sum)
