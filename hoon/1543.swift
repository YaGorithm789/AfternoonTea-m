let str = readLine()!.map { $0 }
let target = readLine()!
var answer = 0
var i = 0

while i <= str.count - target.count {
    if String(str[i..<i + target.count]) == target {
        answer += 1
        i += target.count
        continue
    }
    
    i += 1
}

print(answer)
