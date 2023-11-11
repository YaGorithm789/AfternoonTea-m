let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").map { Int($0)! }
let x = Int(readLine()!)!
var answer = 0
var dict = [Int: Int]()

for i in seq {
    if dict[x - i] == 1 {
        answer += 1
    }
    
    dict[i, default: 0] += 1
}

print(answer)
