let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted().map(String.init)
var number = [String]()
var result = ""

func back() {
    if number.count == m {
        result += number.joined(separator: " ") + "\n"

        return
    }
    
    for i in 0..<n {
        number.append(arr[i])
        back()
        number.removeLast()
    }
}

back()
print(result)
