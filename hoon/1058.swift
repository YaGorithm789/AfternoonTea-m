import Foundation

let n = Int(readLine()!)!
var adj = Array(repeating: Array(repeating: false, count: n), count: n)
var answer = 0

for i in 0..<n {
    let line = Array(readLine()!)
    
    for j in 0..<n {
        adj[i][j] = (line[j] == "Y")
    }
}

for i in 0..<n {
    var seen = Array(repeating: false, count: n)

    for k in 0..<n {
        if adj[i][k] {
            seen[k] = true
            
            for j in 0..<n {
                if adj[k][j] {
                    seen[j] = true
                }
            }
        }
    }

    seen[i] = false
    var cnt = 0
    
    for j in 0..<n {
        if seen[j] { cnt += 1 }
    }
    
    if cnt > answer { answer = cnt }
}

print(answer)
