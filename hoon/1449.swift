let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], l = input[1]
let pipe = readLine()!.split(separator: " ").map { Int($0)! }
var isFunk = [Bool](repeating: false, count: 1001)
var count = 0
var i = 1

for p in pipe {
    isFunk[p] = true
}

while i <= 1000 {
    if isFunk[i] {
        i += l
        count += 1
    } else {
        i += 1
    }
}

print(count)
