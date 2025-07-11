let input = Array(readLine()!)
var sum: Int = 0
var deci: Int = 1

for i in stride(from: input.count - 1, through: 0, by: -1) {
    var num: Int = 0
    
    switch input[i] {
    case "A":
        num = 10
    case "B":
        num = 11
    case "C":
        num = 12
    case "D":
        num = 13
    case "E":
        num = 14
    case "F":
        num = 15
    default:
        num = Int(String(input[i]))!
    }
    
    sum += num * deci
    deci *= 16
}

print(sum)
