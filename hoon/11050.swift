let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var result = 1

(1..<n + 1).forEach { result *= $0 }
(1..<k + 1).forEach { result /= $0 }
(1..<n - k + 1).forEach { result /= $0 }

print(result)
