let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var number = [Int]()
var isUsed = Array(repeating: false, count: n)
var result = ""

func back(k: Int) {
    if number.count == m {
        result += number.map(String.init).joined(separator: " ") + "\n"

        return
    }
    
    for i in 0..<n {
        if !isUsed[i] && k < arr[i] {
            number.append(arr[i])
            isUsed[i] = true
            back(k: arr[i])
            number.removeLast()
            isUsed[i] = false
        }
    }
}

back(k: 0)
print(result)
