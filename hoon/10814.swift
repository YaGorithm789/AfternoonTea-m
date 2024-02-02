let n = Int(readLine()!)!
var arr = Array(repeating: [String](), count: 201)

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map(String.init)
    arr[Int(input[0])!].append(input.joined(separator: " "))
}

for i in 1...200 {
    for j in arr[i] {
        print(j)
    }
}
