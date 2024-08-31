let n = Int(readLine()!)!
typealias Egg = (d: Int, w: Int)
var eggs = [Egg](repeating: (0, 0), count: n)
var result = 0

for i in 0..<n {
    let egg = readLine()!.split(separator: " ").map { Int(String($0))! }
    eggs[i] = (egg[0], egg[1])
}

dfs(idx: 0)
print(result)

func dfs(idx: Int) {
    if idx == n {
        var tmp = 0
        
        for i in 0..<n {
            if eggs[i].d <= 0 {
                tmp += 1
            }
        }
        
        result = max(result, tmp)
        return
    }
    
    var flag = false
    
    for i in 0..<n {
        if i != idx && eggs[idx].d > 0 && eggs[i].d > 0 {
            flag = true
            
            eggs[i].d -= eggs[idx].w
            eggs[idx].d -= eggs[i].w
            
            dfs(idx: idx+1)
            
            eggs[i].d += eggs[idx].w
            eggs[idx].d += eggs[i].w
        }
    }
    
    if !flag {
        dfs(idx: idx + 1)
    }
}
