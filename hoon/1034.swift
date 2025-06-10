let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var neededCols = [[Int]: Int]()

for _ in 0..<n {
    let row = readLine()!.map { $0 == "1" }
    var need = [Int]()
    
    for i in 0..<m {
        if row[i] == false { need.append(i) }
    }
    
    neededCols[need] = neededCols[need] != nil ? neededCols[need]! + 1 : 1
}

let k = Int(readLine()!)!
var result = 0

for col in neededCols {
    let cnt = col.key.count
    
    if cnt <= k && (k - cnt) % 2 == 0 {
        result = max(result, col.value)
    }
}

print(result)
