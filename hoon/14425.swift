var ArrayOfNM = readLine()!.split(separator: " ").map { Int(String($0))! }
var N = ArrayOfNM[0]
var M = ArrayOfNM[1]
var S = Set<String>()

for _ in 0..<N {
    S.insert(readLine()!)
}

var count = 0

for _ in 0..<M {
    if S.contains(readLine()!) {
        count += 1
    }
}

print(count)
