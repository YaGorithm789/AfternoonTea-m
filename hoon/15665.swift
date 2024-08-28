let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

func dfs(_ current: String, _ depth: Int) {
    var last = 0
    
    if depth == input[1] {
        print(current)
        return
    }
    
    for i in 0..<input[0] {
        if last != numbers[i] {
            dfs(current + "\(numbers[i]) ", depth + 1)
            last = numbers[i]
        }
    }
}

dfs("", 0)
