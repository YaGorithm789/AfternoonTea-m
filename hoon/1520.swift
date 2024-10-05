let size = readLine()!.split(separator: " ").map { Int($0)! }
let y = size[0]
let x = size[1]
var map: [[Int]] = []
let directions = [(0, -1), (0, 1), (-1, 0), (1, 0)]
var dp = Array(repeating: (Array(repeating: -1, count: x)), count: y)
 
for _ in 0..<y {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}
 
func dfs(pointX: Int, pointY: Int) -> Int {
    if pointX == x - 1 && pointY == y - 1 {
        return 1
    }
    
    if dp[pointY][pointX] != -1 {
        return dp[pointY][pointX]
    }
    
    dp[pointY][pointX] = 0
    
    for direction in directions {
        let newX = pointX + direction.0
        let newY = pointY + direction.1
        
        if newX >= 0 && newX < x && newY >= 0 && newY < y && map[pointY][pointX] > map[newY][newX] {
            dp[pointY][pointX] += dfs(pointX: newX, pointY: newY)
        }
    }
    
    return dp[pointY][pointX]
}
 
print(dfs(pointX: 0, pointY: 0))
