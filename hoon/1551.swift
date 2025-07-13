let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = firstLine[0]
let k = firstLine[1]
let sequence = readLine()!.split(separator: ",").map { Int(String($0))! }
var currentSequence = sequence

for _ in 0..<k {
    var nextSequence: [Int] = []
    
    for i in 0..<currentSequence.count - 1 {
        nextSequence.append(currentSequence[i + 1] - currentSequence[i])
    }
    
    currentSequence = nextSequence
}

let result = currentSequence.map { String($0) }.joined(separator: ",")
print(result)
