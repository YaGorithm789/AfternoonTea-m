let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = [String]()
var result = ""

func back(k: Int) {
    if arr.count == m {
        result += arr.joined(separator: " ") + "\n"

        return
    }

    for i in 1...n {
        if k <= i {
            arr.append(String(i))
            back(k: i)
            arr.removeLast()
        }
    }
}

back(k: 0)
print(result)
