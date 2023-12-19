let t = Int(readLine()!)!
let directions = [(-1, 0), (0, -1), (1, 0), (0, 1)]

for _ in 1...t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, k) = (input[0], input[1], input[2])
    var farm = Array(repeating: Array(repeating: 0, count: m), count: n)
    var stack = [(Int, Int)]()
    var result = 0
    
    for _ in 1...k {
        let point = readLine()!.split(separator: " ").map { Int($0)! }
        let (x, y) = (point[1], point[0])
        farm[x][y] = 1
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if farm[i][j] == 1 {
                stack.append((i, j))
                result += 1
            }
            
            while let (x, y) = stack.popLast() {
                farm[x][y] = 0
                
                for (dx, dy) in directions {
                    guard 0..<n ~= x + dx,
                          0..<m ~= y + dy,
                          farm[x + dx][y + dy] == 1
                    else { continue }
                    
                    stack.append((x + dx, y + dy))
                }
            }
        }
    }
    
    print(result)
}
