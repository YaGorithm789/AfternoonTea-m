let ndkc = readLine()!.split(separator: " ").map { Int($0)! }
let n = ndkc[0], d = ndkc[1], k = ndkc[2], c = ndkc[3]
var sushi = [Int]()

for _ in 0..<n {
    sushi.append(Int(readLine()!)!)
}

sushi += sushi
var start = 0, end = 0, result = 0
var kind = [c: 1]

while end < k {
    kind[sushi[end], default: 0] += 1
    end += 1
}

while end < sushi.count {
    result = max(result, kind.count)
    
    kind[sushi[start]]! -= 1
    
    if kind[sushi[start]] == 0 {
        kind[sushi[start]] = nil
    }
    
    kind[sushi[end], default: 0] += 1
    start += 1
    end += 1
}

print(result)
