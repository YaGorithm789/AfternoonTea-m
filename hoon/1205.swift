let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], score = input[1], p = input[2]

if n == 0 {
    print(1)
} else {
    var scores = readLine()!.split(separator: " ").map { Int($0)! } + [score]
    scores.sort(by: >)
    
    if scores.lastIndex(of: score)! >= p {
        print(-1)
    } else {
        print(scores.firstIndex(of: score)! + 1)
    }
}
