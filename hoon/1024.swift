let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0
var sum = 0
var result = [Int]()

while answer < 100 {
    answer += 1
    var plus = 0
    
    for i in 1..<answer {
        plus += i
    }
    
    var dev = input[0] - plus
    
    if dev < 0 {
        break
    }
    
    var a = Double(dev) / Double(answer)
    
    if dev % answer == 0 && answer >= input[1] {
        result.append(Int(a))
        break
    }
}

if result.isEmpty {
    print(-1)
} else {
    for i in 1..<answer {
        result.append(result[0] + i)
    }
    
    print(result.map { String($0) }.joined(separator: " "))
}
