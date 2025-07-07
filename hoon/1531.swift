let NM = readLine()!.split(separator: " ").map { Int($0)! }
var picture = Array(repeating: Array(repeating: 0, count: 100), count: 100)

for _ in 0..<NM[0] {
    let locs = readLine()!.split(separator: " ").map { Int($0)! }
    
    for x in locs[0]...locs[2] {
        for y in locs[1]...locs[3] {
            picture[x - 1][y - 1] += 1
        }
    }
}

print(
    picture.reduce(0) { (sum: Int, arr: [Int]) -> Int in
        return sum + arr.filter { (pixel: Int) -> Bool in
            return pixel > NM[1]
        }.count
    }
)
