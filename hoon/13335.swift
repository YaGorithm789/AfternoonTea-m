let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w, l) = (input[0], input[1], input[2])
var weight = readLine()!.split(separator: " ").map { Int($0)! }
var result = w
var queue = Array(repeating: 0, count: w)

while !weight.isEmpty {
    result += 1
    queue.removeFirst()
    
    if queue.reduce(0, +) + weight[0] <= l {
        queue.append(weight.removeFirst())
    } else {
        queue.append(0)
    }
    
}

print(result)
