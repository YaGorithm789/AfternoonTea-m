import Foundation

struct Point {
    var x: Int
    var y: Int
    var dist: Int
}

func moveTaxi(_ sx: Int, _ sy: Int, _ ex: Int?, _ ey: Int?) -> Point {
    var minDist: Point = Point(x: -1, y: -1, dist: .max)
    var queue: Queue = Queue<Point>()
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

    visited[sx][sy] = true
    queue.enqueue(Point(x: sx, y: sy, dist: 0))

    while !queue.isEmpty {
        let now = queue.dequeue()!
        visited[now.x][now.y] = true

        if atDestination(now, ex, ey) {
            return now
        } else {
            filterPassenger(now, &minDist)
        }

        for i in 0 ..< 4 {
            let nx = now.x + dx[i]
            let ny = now.y + dy[i]

            if !isInBound(nx, ny) || board[nx][ny] == 1 || visited[nx][ny] {
                continue
            }
          
            queue.enqueue(Point(x: nx, y: ny, dist: now.dist + 1))
            visited[nx][ny] = true
        }
    }

    return minDist
}

func isInBound(_ x: Int, _ y: Int) -> Bool {
    return n > x && x >= 0 && n > y && y >= 0
}

func atDestination(_ now: Point, _ ex: Int?, _ ey: Int?) -> Bool {
    if ex != nil && ey != nil {
        if now.x == ex && now.y == ey {
            return true
        }
    }
    return false
}

func filterPassenger(_ now: Point, _ minDist: inout Point) {
    if board[now.x][now.y] == 2 && minDist.dist >= now.dist {
        if now.dist == minDist.dist {
            if now.x < minDist.x {
                minDist = Point(x: now.x, y: now.y, dist: now.dist)
            } else if now.x == minDist.x {
                if now.y < minDist.y {
                    minDist = Point(x: now.x, y: now.y, dist: now.dist)
                }
            }
        } else {
            minDist = Point(x: now.x, y: now.y, dist: now.dist)
        }
    }
}

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var oil = input[2]
var board: [[Int]] = []

for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

let taxi = readLine()!.split(separator: " ").map { Int(String($0))! }
var (taxiX, taxiY) = (taxi[0] - 1, taxi[1] - 1)
var destination: [[Int]: [Int]] = [:]

for _ in 0 ..< m {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }

    let (px, py, ax, ay) = (info[0] - 1, info[1] - 1, info[2] - 1, info[3] - 1)

    board[px][py] = 2
    destination[[px, py]] = [ax, ay]
}

for _ in 0 ..< m {
    let pointP = moveTaxi(taxiX, taxiY, nil, nil)
    (taxiX, taxiY) = (pointP.x, pointP.y)

    if pointP.x == -1 || oil < pointP.dist {
        oil = -1
        break
    }

    board[pointP.x][pointP.y] = 0
    oil -= pointP.dist

    let des = destination[[pointP.x, pointP.y]]!
    let (desX, desY) = (des[0], des[1])

    let pointD = moveTaxi(taxiX, taxiY, desX, desY)
    (taxiX, taxiY) = (desX, desY)

    oil -= pointD.dist

    if oil < 0 {
        oil = -1
        break
    }

    oil += pointD.dist * 2
}

print(oil)
