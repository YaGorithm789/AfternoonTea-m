let n = Int(readLine()!)!
var answer: [String] = []

for _ in 0..<n {
    var input = readLine()!.split(separator: " ").map { String($0) }
    
    switch input[0] {
    case "push":
        answer.append(input[1])
    case "pop":
        if answer.isEmpty {
            print(-1)
        } else {
            print(answer.removeFirst())
        }
    case "size":
        print(answer.count)
    case "empty":
        if answer.isEmpty {
            print(1)
        } else {
            print(0)
        }
    case "front":
        if answer.isEmpty {
            print(-1)
        } else {
            print(answer[0])
        }
    default :
        if answer.isEmpty {
            print(-1)
        } else {
            print(answer.last!)
        }
    }
}
