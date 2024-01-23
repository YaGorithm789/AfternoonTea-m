let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = Array(repeating: 0, count: m)
var result = ""

func back(k: Int) {
    if k == m {
        result += arr.map(String.init).joined(separator: " ") + "\n"
        
        return
    }
    
    for i in 1...n {
        arr[k] = i
        back(k: k + 1)
    }
}

back(k: 0)
print(result)
