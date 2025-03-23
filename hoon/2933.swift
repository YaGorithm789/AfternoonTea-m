import Foundation

let direction = [(-1,0),(1,0),(0,1),(0,-1)]
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let width = input[1] , height = input[0]
var map = Array(repeating: [String](), count: height)
var visited = [[Bool]]()
var i = 0

for y in 0..<height {
    let line = readLine()!.map{String($0)}
    map[y] = line
}

let throwCount = Int(readLine()!)!
let throwHeights = readLine()!.split(separator: " ").map{ height - 1 - (Int(String($0))! - 1)}

func findItemInRow(at height: Int, isleftToRight ltr: Bool? = nil) {
    guard let _ = ltr else {
        for x in stride(from: width - 1, through: 0, by: -1) {
            if map[height][x] == "x" {
                map[height][x] = "."
                return
            }
        }
        return
    }
    
    for x in 0..<width {
        if map[height][x] == "x" {
            map[height][x] = "."
            return
        }
    }
}

func isOutOfMap(nx: Int, ny: Int) -> Bool {
    if nx < 0 || nx > width - 1 || ny < 0 || ny > height - 1 {
        return true
    }
    return false
}

func isSafetyCluster(y: Int) -> Bool {
    return y == height - 1 ? true : false
}

func bfs(x: Int, y: Int) -> (Bool,[(Int,Int)]?) {
    var isSafety = false
    var queue = [(x,y)]
    var index = 0
    
    while queue.count != index {
        let (curX,curY) = queue[index]
        if !isSafety { isSafety = isSafetyCluster(y: curY) }
        direction.forEach{ dx,dy in
            let (nx,ny) = (curX+dx,curY+dy)
            if isOutOfMap(nx: nx, ny: ny) { return }
            if !visited[ny][nx] && map[ny][nx] == "x" {
                visited[ny][nx] = true
                queue.append((nx,ny))
            }
        }
        index += 1
    }
    return isSafety ? (isSafety,nil) : (isSafety,queue)
}

func updateMap() {
    visited = Array(repeating: Array(repeating: false, count: width), count: height)
    var isSafety = true
    var unsafetyCluster = [(Int,Int)]()
    for y in 0..<height {
        for x in 0..<width {
            if map[y][x] == "x" && !visited[y][x] {
                visited[y][x] = true
                let temp = bfs(x: x, y: y)
                if !temp.0 {
                    isSafety = temp.0
                    unsafetyCluster = temp.1!
                }
                
            }
        }
    }
    
    if !isSafety {
        unsafetyCluster.forEach{ (x,y) in
            map[y][x] = "."
        }
        fixUnsafetyCluster(cluster: &unsafetyCluster)
    }
}

func fixUnsafetyCluster(cluster: inout [(Int,Int)]) {
    var isSafety = false
    while !isSafety {
        var visit = Array(repeating: Array(repeating: false, count: width), count: height)
        cluster = cluster.map { (x,y) in
            visit[y+1][x] = true
            return (x,y+1)
        }
       isSafety = checkIsSafedCluster(cluster: cluster, visit: visit)
    }
    cluster.forEach { (x,y) in
        map[y][x] = "x"
    }
}

func checkIsSafedCluster(cluster: [(Int,Int)], visit: [[Bool]]) -> Bool {
    var index = 0
    while cluster.count != index {
        let (x,y) = cluster[index]
        if y == height - 1 {
            return true
        }
        let (dx,dy) = (0,1)
        let (nx,ny) = (x+dx,y+dy)
        
        if isOutOfMap(nx: nx, ny: ny) { continue }
        if !visit[ny][nx] && map[ny][nx] == "x" { return true }
        index += 1
    }
    return false
}

throwHeights.forEach { height in
    findItemInRow(at: height, isleftToRight: i  % 2 == 0 ? true : nil)
    i += 1
    updateMap()
}

for line in map {
    print(line.joined())
}
