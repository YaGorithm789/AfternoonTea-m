let times = readLine()!.split { $0 == " " }.map { String($0) }
let (S, E, Q) = (times[0], times[1], times[2])
var enter = Set<String>()
var leave = Set<String>()

while let input = readLine()?.split(separator: " ").map { String($0) }, !input.isEmpty {
    let timestamp = input[0]
    let userName = input[1]
    
    if timestamp <= S {
        enter.insert(userName)
    }
    
    if (E...Q).contains(timestamp) {
        leave.insert(userName)
    }
}

print(enter.intersection(leave).count)
