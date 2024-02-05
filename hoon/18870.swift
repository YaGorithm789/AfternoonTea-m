let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var arr2 = [Int: Int]()
let arr3 = Set(arr).sorted()
var result = ""

for i in arr3.enumerated() {
    arr2[i.element] = i.offset
}

arr.forEach {
    result += "\(arr2[$0]!) "
}

print(result)
