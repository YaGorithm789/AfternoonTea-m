let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
var check = [Bool](repeating: false, count: input[0])
var result: [[Int]] = []

func dfs(_ arr: [Int]) {
    var last = 0
    
    if arr.count == input[1] {
        result.append(arr)
        return
    }
    
    for i in 0..<input[0] {
        if !check[i] && last != numbers[i] {
            check[i] = true
            dfs(arr + [numbers[i]])
            last = numbers[i]
            check[i] = false
        }
    }
}

dfs([])

for num in result {
    print(num.map { String($0) }.joined(separator: " "))
}
