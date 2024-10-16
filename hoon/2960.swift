let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
var cnt = 0
var arr = Array(repeating: true, count: n + 1)

for i in 2..<n + 1 {
    for j in stride(from: i, to: n + 1, by: i) {
        if arr[j] {
            arr[j] = false
            cnt += 1
            
            if cnt == k {
                print(j)
                break
            }
        }
    }
}
