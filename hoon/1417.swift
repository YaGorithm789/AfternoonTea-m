let n = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

var target = arr.removeFirst()
var count = 0

while arr.max() ?? 0 >= target {
    if let maxIndex = arr.firstIndex(of: arr.max()!) {
        arr[maxIndex] -= 1
        target += 1
        count += 1
    }
}

print(count)
