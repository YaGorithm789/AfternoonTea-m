let pos = [(-2, -1), (-2, 1), (-1, 2), (1, 2), (2, 1), (2, -1), (1, -2), (-1, -2)]
var chess = Array(repeating: Array<Bool>(repeating: false, count: 6), count: 6)
var start: (x: Int, y: Int) = (0, 0)
var prev: (x: Int, y: Int) = (0, 0)
var end: (x: Int, y: Int) = (0, 0)
var tour = true

for count in 0..<36 {
    let axis = Array(readLine()!)
    let x = Int(axis[0].asciiValue!) - 65
    let y = Int(String(axis[1]))! - 1
    
    if count == 0 {
        chess[x][y].toggle()
        start.x = x
        start.y = y
        prev.x = x
        prev.y = y
        continue
    } else {
        if count == 35 {
            end.x = x
            end.y = y
        }
        
        tour = false
        
        for p in pos {
            let nx = prev.x + p.0
            let ny = prev.y + p.1
            
            if (0..<6).contains(nx) && (0..<6).contains(ny) {
                if nx == x && ny == y && !chess[nx][ny] {
                    chess[nx][ny].toggle()
                    prev.x = nx
                    prev.y = ny
                    tour = true
                    break
                }
            }
        }
        
        if !tour {
            break
        }
    }   
}

if tour {
    tour = false
    
    for p in pos {
        let nx = end.x + p.0
        let ny = end.y + p.1
        
        if (0..<6).contains(nx) && (0..<6).contains(ny) {
            if nx == start.x && ny == start.y {
                tour = true
                break
            }
        }
    }
}


print(tour ? "Valid" : "Invalid")
