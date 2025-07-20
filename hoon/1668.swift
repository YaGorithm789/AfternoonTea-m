let n = Int(readLine()!)!
var trophies: [Int] = []

for _ in 0..<n {
    trophies.append(Int(readLine()!)!)
}

func countVisibleTrophies(trophies: [Int]) -> Int {
    var count = 0
    var maxHeight = 0
    
    for trophy in trophies {
        if trophy > maxHeight {
            count += 1
            maxHeight = trophy
        }
    }
    
    return count
}

let leftVisible = countVisibleTrophies(trophies: trophies)
let rightVisible = countVisibleTrophies(trophies: trophies.reversed())
print(leftVisible)
print(rightVisible)
