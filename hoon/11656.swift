let s = Array(readLine()!)
var arr = [String]()

for i in 0...s.count - 1 {
    arr.append(String(s[i...]))
}

arr.sorted().forEach { print($0) }
