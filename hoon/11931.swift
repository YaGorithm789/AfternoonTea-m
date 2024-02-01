let n = Int(readLine()!)!
var arr = [Int]()
var result = ""

for _ in 1...n {
    arr.append(Int(readLine()!)!)
}

arr.sorted(by: >).forEach {
    result += "\($0)\n"
}

print(result)
