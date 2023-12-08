let input = Array(readLine()!)
let n = input.count
var pipe = 0
var result = 0

for idx in 0..<n {
    if input[idx] == ")" && input[idx - 1] == "(" {
        pipe -= 1
        result += pipe
    } else if input[idx] == ")" {
        pipe -= 1
        result += 1
    } else {
        pipe += 1
    }
}

print(result)
