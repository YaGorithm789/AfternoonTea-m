let L = Int(readLine()!)!
let S = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let n = Int(readLine()!)!
let min = S.last { $0 < n }
let max = S.first { $0 > n }

if S.contains(n) {
    print(0)
} else if min == nil {
    print(n * (max! - n) - 1)
} else {
    print((n - (min ?? n)) * ((max ?? n) - n) - 1)
}
