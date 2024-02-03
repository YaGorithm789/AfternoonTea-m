let n = Int(readLine()!)!
var arr = [[Int]]()
var result = ""

for _ in 1...n {
    arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

arr.sorted {
    if $0[0] == $1[0] {
        return $0[1] < $1[1]
    }

    return $0[0] < $1[0]
}.forEach {
    result += "\($0.map(String.init).joined(separator: " "))\n"
}

print(result)
