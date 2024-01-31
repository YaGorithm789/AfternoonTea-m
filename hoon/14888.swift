let n = Int(readLine()!)!
let operand = readLine()!.split(separator: " ").map { Int($0)! }
var oper = readLine()!.split(separator: " ").map { Int($0)! }
var maxValue = Int.min
var minValue = Int.max

func back(answer: Int, idx: Int) {
    if idx == n {
        maxValue = max(maxValue, answer)
        minValue = min(minValue, answer)
        
        return
    }
    
    for i in 0..<4 {
        guard oper[i] > 0 else { continue }
        
        oper[i] -= 1
        
        switch i {
        case 0:
            back(answer: answer + operand[idx], idx: idx + 1)
        case 1:
            back(answer: answer - operand[idx], idx: idx + 1)
        case 2:
            back(answer: answer * operand[idx], idx: idx + 1)
        case 3:
            back(answer: answer / operand[idx], idx: idx + 1)
        default:
            break
        }
        
        oper[i] += 1
    }
}

back(answer: operand[0], idx: 1)
print(maxValue, minValue, separator: "\n")
