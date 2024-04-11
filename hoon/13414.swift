let kl = readLine()!.split(separator: " ").map { Int($0)! }
let k = kl[0], l = kl[1]
var result = [String: Int]()
var order = [String]()
var clear = [String]()

for _ in 0..<l {
    let student = readLine()!
    
    order.append(student)
    result[student, default: 0] += 1
}

for i in order {
    if result[i]! > 1 {
        result[i]! -= 1
        continue
    }
    
    clear.append(i)
}

clear[0..<min(k, clear.count)].forEach {
    print($0)
}
