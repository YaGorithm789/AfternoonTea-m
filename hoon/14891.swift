import Foundation

var gears = [String]()

for _ in 0..<4 {
    let gear = readLine()!
    gears.append(gear)
}

let k = Int(readLine()!)!

func groupGears(_ n: Int) -> [Int] {
    var parents = [0, 1, 2, 3]
    
    func find(_ a: Int) -> Int {
        return parents[a] == a ? a : find(parents[a])
    }
    
    func union(_ a: Int, _ b: Int) {
        let a = find(a)
        let b = find(b)
        parents[b] = a
    }
    
    for i in 0..<3 {
        if gears[i].prefix(3).last != gears[i + 1].prefix(7).last {
            union(i, i + 1)
        }
    }
    
    return parents
}

func rotateGear(_ i: Int, _ isClockwise: Bool) {
    if isClockwise {
        gears[i].insert(gears[i].removeLast(), at: gears[i].startIndex)
    } else {
        gears[i].append(gears[i].removeFirst())
    }
}

func getScore() -> Int {
    var ans = 0
    
    for i in gears.indices {
        if gears[i].first == "1" {
            ans += Int(pow(2.0, Double(i)))
        }
    }
    
    return ans
}

for _ in 0..<k {
    let nd = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = nd[0] - 1
    let d = nd[1] == 1 ? true : false
    
    let parents = groupGears(n)
        
    for i in 0..<4 {
        if parents[n] == parents[i] {
            if abs(n-i) % 2 == 0 {
                rotateGear(i, d)
            } else {
                rotateGear(i, !d)
            }
        }
    }
}

print(getScore())
