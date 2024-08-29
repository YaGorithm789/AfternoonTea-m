let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]
let array = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

var result = [String]()
var check = Set<String>()

func dfs(_ index: Int) {
    if result.count == M {
        let resultString = result.joined(separator: " ")
        
        if !check.contains(resultString) {
            check.insert(resultString)
            print(resultString)
        }
        
        return
    }

    for i in index..<N {
        result.append(String(array[i]))
        dfs(i)
        _ = result.popLast()
    }
}

dfs(0)
