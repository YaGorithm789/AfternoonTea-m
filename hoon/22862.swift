let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
let s = readLine()!.split(separator: " ").map { Int($0)! }
var start = 0, end = 0, result = 0, count = k, answer = [Int]()

while end < n {    
    if s[end] % 2 == 0 {
        end += 1
        result += 1
    } else if s[end] % 2 != 0 && count > 0 {
        end += 1
        count -= 1
    } else if s[start] % 2 == 0 {
        result -= 1
        start += 1
    } else {
        start += 1
        count += 1
    }
    
    answer.append(result)
}

print(answer.max()!)
