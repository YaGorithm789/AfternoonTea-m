var input = Array(readLine()!)

for i in 0..<input.count {
    var num = Int(String(input[i]))!
    var answer = ""

    if num == 0 {
        answer += "0"
    } else {
        while num != 1 {
            answer += String(num % 2)
            num = num / 2
        }
        
        answer += "1"
    }

    if i > 0 && answer.count == 1 {
        answer += "00"
    } else if i > 0 && answer.count == 2 {
        answer += "0"
    }
    
    print(String(answer.reversed()), terminator: "")
}
