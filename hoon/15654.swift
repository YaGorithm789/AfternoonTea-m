let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted().map(String.init)
var number = [String]()
var isUsed = Array(repeating: false, count: n)
var result = ""

func back() {
    if number.count == m {
        result += number.joined(separator: " ") + "\n"
        
        return
    }

    for i in 0..<n {
        if !isUsed[i] {
            number.append(arr[i])
            isUsed[i] = true
            back()
            number.removeLast()
            isUsed[i] = false
        }
    }
}

back()
print(result)
