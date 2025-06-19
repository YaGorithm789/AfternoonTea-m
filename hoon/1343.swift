func cover(_ str: String) -> String {
    let n = str.count
    
    if n % 2 == 1 {
        return str
    }
    
    return String(repeating: "AAAA", count: n / 4) + String(repeating: "BB", count: (n % 4) / 2)
}

let board = readLine()!
var x = ""
var answer = ""

for b in board {
    if b == "." {
        answer += cover(x)
        answer += "."
        x = ""
        continue
    }
    
    x += String(b)
}

answer += cover(x)
answer.contains("X") ? print(-1) : print(answer)
