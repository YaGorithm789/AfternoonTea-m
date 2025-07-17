let n = Int(readLine()!)!
var room = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for i in 0..<n {
    room[i] = readLine()!.map { String($0) == "." }
}

var h = 0

for i in 0..<n {
    var flag = false
    
    for j in 1..<n {
        if room[i][j - 1] && room[i][j] && !flag {
            h += 1
            flag = true
        }
        
        if !room[i][j] { flag = false }
    }
}

var v = 0

for i in 0..<n {
    var flag = false
    
    for j in 1..<n {
        if room[j - 1][i] && room[j][i] && !flag {
            v += 1
            flag = true
        }
        
        if !room[j][i] { flag = false }
    }
}

print(h, v)
