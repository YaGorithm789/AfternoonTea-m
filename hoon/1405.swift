let input = readLine()!.split(separator : " " ).map { Int(String($0))! }
let K = input[0], E = Double(input[1]) / 100, W = Double(input[2]) / 100, N = Double(input[3]) / 100, S = Double(input[4]) / 100
let dict = [0: E, 1: W, 2: N, 3: S]
let direction = [(0, 1), (0, -1), (-1, 0), (1, 0)]
var sum : Double = 0.0
var visit = Array(repeating: Array(repeating: false, count: 31),count : 31)
visit[15][15] = true

func dfs(next: (Int,Int), value: Double, count: Int) {
    if count == K {
        sum += value
        return
    }
    
    for i in 0..<4 {
        let next = (next.0 + direction[i].0, next.1 + direction[i].1)
        
        if visit[next.0][next.1] == false {
            visit[next.0][next.1] = true
            dfs(next: next, value: dict[i]! * value, count: count + 1)
            visit[next.0][next.1] = false
        }
    }
}

dfs(next: (15, 15), value: 1.0, count: 0)
print(sum)
