let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = Array(repeating: 0, count: 10)
var isUsed = Array(repeating: false, count: 10)

func back(k: Int) {
    if k == m {
        for i in 0..<m {
            print(arr[i], terminator: " ")
        }
        
        print()
        return
    }
    
    for i in 1...n {
        if !isUsed[i] {
            arr[k] = i
            isUsed[i] = true
            back(k: k + 1)
            isUsed[i] = false
        }
    }
}

back(k: 0)
