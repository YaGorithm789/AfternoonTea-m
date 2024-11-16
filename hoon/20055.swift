struct Belt {
    var robot: Bool
    var duration: Int
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], K = input[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var belts = [Belt]()
var result = 0

for (i, x) in arr.enumerated() {
    belts.append(Belt(robot: false, duration: x))
}

while true {
    result += 1
    belts.insert(belts.removeLast(), at: 0)
    
    if belts[N - 1].robot == true { belts[N - 1].robot = false }
    
    for i in stride(from: N - 2, to: -1, by: -1) {
        if belts[i].robot == true, belts[i + 1].robot == false, belts[i + 1].duration > 0 {
            belts[i].robot = false
            belts[i + 1].robot = true
            belts[i + 1].duration -= 1
            
            if i + 1 == N - 1 { belts[i + 1].robot = false }
        }
    }
    
    if belts[0].robot == false && belts[0].duration > 0 {
        belts[0].duration -= 1
        belts[0].robot = true
    }
    
    let zeroCount = belts.filter { $0.duration == 0 }.count
    
    if zeroCount >= K {
        break
    }
}

print(result)
