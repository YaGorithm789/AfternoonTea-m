let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])
var input = [[Int]]()
var result = 1

for _ in 0..<n {
    let dd = Array(readLine()!).map { Int(String($0))! }
    input.append(dd)
}

for size in 1..<min(n, m) {
    for i in 0..<n - size {
        for j in 0..<m - size {
            let topLeft = input[i][j]
            let topRight = input[i][j + size]
            let bottomLeft = input[i + size][j]
            let bottomRight = input[i + size][j + size]
            
            if topLeft == topRight && topLeft == bottomLeft && topLeft == bottomRight {
                result = (size + 1) * (size + 1)
            }
        }
    }
}

print(result)
