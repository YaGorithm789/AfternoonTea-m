let t = Int(String(readLine()!))!
var tostenes = Array(repeating: 1, count: 10001)

for i in 2..<10001 {
    tostenes[i] = i
}

for i in 2..<10001 {
    if tostenes[i] == 0 { continue }
    
    for j in stride(from: i + i, to: 10001, by: i) {
        tostenes[j] = 0
    }
}

for _ in 0..<t {
    let two = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = two[0]
    let b = two[1]
    
    bfs(a, b)
}


func bfs(_ a: Int, _ b: Int) {
    var visited = Array(repeating: false, count: 10000)
    var queue = [(Int, Int)]()
    queue.append((a, 0))
    visited[a] = true
    
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        
        if pop.0 == b {
            print(pop.1)
            break
        }
        
        var n = pop.0
        let sausands = n / 1000
        n = n % 1000
        let hundreds = n / 100
        n = n % 100
        let ten = n / 10
        n = n % 10
        let one = n
        var arr = [sausands, hundreds, ten, one]

        for i in 0...9 {
            for j in 0..<4 {
                let temp = arr[j]
                arr[j] = i
                let total = arr[0] * 1000 + arr[1] * 100 + arr[2] * 10 + arr[3]
                
                if total >= 1000 && total <= 9999 && tostenes[total] != 0 && !visited[total] {
                    queue.append((total, pop.1 + 1))
                    visited[total] = true
                }
                
                arr[j] = temp
            }            
        }
    }
}
