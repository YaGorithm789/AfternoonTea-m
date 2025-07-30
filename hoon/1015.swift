let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var B = A.sorted { a, b in a <= b }

for a in A {
    let i = B.firstIndex(of: a)!
    B[i] = 0
    print(i, terminator: " ")
}
