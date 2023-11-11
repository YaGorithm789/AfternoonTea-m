let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
var room = [String: Int]()
var answer = 0

for _ in 1...n {
    let student = readLine()!
    room[student, default: 0] += 1
}

for i in room.values {
    answer += (i + k - 1) / k
}

print(answer)
