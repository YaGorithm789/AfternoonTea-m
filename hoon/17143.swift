struct Shark {
    enum Direction: Int {
        case on = 1
        case under
        case right
        case left
    }
    
    var i: Int
    var j: Int
    let speed: Int
    var direction: Direction
}

let direcMovieCoordi = [(-1, 0), (1, 0), (0, 1), (0, -1)]

let rcm = readLine()!.split(separator: " ").map { Int($0)! }
let r = rcm[0]
let c = rcm[1]
let m = rcm[2]
var answer = 0
var sharkDict: [Int:Shark] = [:]
var sharkMap: [[Int]] = Array(repeating: Array(repeating: 0, count: c + 1), count: r + 1)

func printSharkMap() {
    for i in sharkMap {
        print(i.map{ "\($0)" }.joined(separator: " "))
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let sharkI = input[0]
    let sharkJ = input[1]
    let sharkSpeed = input[2]
    let sharkDirec = input[3]
    let sharkSize = input[4]
    sharkDict[sharkSize] = .init(i: sharkI, j: sharkJ, speed: sharkSpeed, direction: .init(rawValue: sharkDirec)!)
    sharkMap[sharkI][sharkJ] = sharkSize
}

func fishing(j: Int) {
    for y in sharkMap.enumerated() {
        if y.element[j] != 0 {
            answer += y.element[j]
            sharkMap[y.offset][j] = 0
            break
        }
    }
}

func moveShark() -> [[Int]] {
    var copyMap = Array(repeating: Array(repeating: 0, count: c + 1), count: r + 1)
    
    for y in 1...r {
        for x in 1...c {
            if sharkMap[y][x] != 0 {
                let sharkSize = sharkMap[y][x]
                let shark = sharkDict[sharkSize]!
                var currentSharkCoordi = (shark.i, shark.j)
                sharkMap[currentSharkCoordi.0][currentSharkCoordi.1] = 0
                var moveCoordi = direcMovieCoordi[shark.direction.rawValue - 1]
                var direction = shark.direction
                var moveLen = shark.speed
                
                switch direction {
                case .on, .under:
                    moveLen %= ((r - 1) * 2)
                case .left, .right:
                    moveLen %= ((c - 1) * 2)
                }
                
                for _ in 0..<moveLen {
                    let di = currentSharkCoordi.0 + moveCoordi.0
                    let dj = currentSharkCoordi.1 + moveCoordi.1
                    
                    if di < 1 || di > r || dj < 1 || dj > c {
                        if direction.rawValue%2 == 0 {
                            direction = .init(rawValue: direction.rawValue - 1)!
                        } else {
                            direction = .init(rawValue: direction.rawValue + 1)!
                        }
                        
                        moveCoordi = direcMovieCoordi[direction.rawValue - 1]
                        currentSharkCoordi.0 = currentSharkCoordi.0 + moveCoordi.0
                        currentSharkCoordi.1 = currentSharkCoordi.1 + moveCoordi.1
                        continue
                    }
                    
                    currentSharkCoordi.0 = di
                    currentSharkCoordi.1 = dj
                }
                
                
                sharkDict[sharkSize] = .init(i: currentSharkCoordi.0, j: currentSharkCoordi.1, speed: shark.speed, direction: direction)
                if copyMap[currentSharkCoordi.0][currentSharkCoordi.1] != 0 {
                    if sharkSize > copyMap[currentSharkCoordi.0][currentSharkCoordi.1] {
                        copyMap[currentSharkCoordi.0][currentSharkCoordi.1] = sharkSize
                    }
                } else {
                    copyMap[currentSharkCoordi.0][currentSharkCoordi.1] = sharkSize
                }
            }
        }
    }
    
    return copyMap
}

for fishingMan in 1...c {
    fishing(j: fishingMan)
    sharkMap = moveShark()
}

print(answer)
