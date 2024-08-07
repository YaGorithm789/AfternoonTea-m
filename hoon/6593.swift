import Foundation

let dx = [1,0,-1,0,0,0]
let dy = [0,1,0,-1,0,0]
let dz = [0,0,0,0,1,-1]

loop: while true {
    let input = readLine()!
    if input == "0 0 0" {
        break
    }
    
    let testCase = input.split(separator: " ").map { Int(String($0))! }
    var building: [[[String]]] = []
    var result = Array(repeating:Array(repeating: Array(repeating: -1, count: testCase[2]), count: testCase[1]), count: testCase[0])
    var queue: [[Int]] = []

    for _ in 0..<testCase[0] {
        var temp: [[String]] = []
        while true {
            let input = readLine()!.map { String($0) }
            if input.isEmpty {
                break
            }
            temp.append(input)
        }
        building.append(temp)
    }
    
    outer: for i in 0..<testCase[0] {
        for j in 0..<testCase[1] {
            for k in 0..<testCase[2] {
                if building[i][j][k] == "S" {
                    queue.append([i,j,k]) //z,x,y
                    result[i][j][k] = 0
                    break outer
                }
            }
        }
    }
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        for i in 0..<dx.count {
            let newZ = current[0] + dz[i]
            let newX = current[1] + dx[i]
            let newY = current[2] + dy[i]
            if newX < 0 || newY < 0 || newZ < 0 || newZ >= testCase[0] || newX >= testCase[1] || newY >= testCase[2] {
                continue
            }
            if building[newZ][newX][newY] == "#" || result[newZ][newX][newY] != -1 {
                continue
            }
            queue.append([newZ,newX,newY])
            result[newZ][newX][newY] = result[current[0]][current[1]][current[2]] + 1
            if building[newZ][newX][newY] == "E" {
                print("Escaped in \(result[newZ][newX][newY]) minute(s).")
                continue loop
            }
        }
    }
    print("Trapped!")
}
