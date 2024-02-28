let input = Array(readLine()!)
var answer = 0
var tmp = ""
var sign = true

for i in input {
    if i == "+" || i == "-" {
        if sign {
            answer += Int(tmp)!
        } else {
            answer -= Int(tmp)!
        }
        
        tmp = ""
    }
    
    if i == "-" {
        sign = false
        continue
    }
    
    tmp += String(i)
}

if sign {
    answer += Int(tmp)!
} else {
    answer -= Int(tmp)!
}

print(answer)
