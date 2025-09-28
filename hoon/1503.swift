import Foundation

let N = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
let M = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
var banned = Set<Int>()

if M > 0 {
    if let line = readLine() {
        for s in line.split(separator: " ") {
            if let v = Int(s) { banned.insert(v) }
        }
    }
}

var cand = [Int]()
cand.reserveCapacity(1000 - M)

for v in 1...1000 where !banned.contains(v) {
    cand.append(v)
}

if cand.isEmpty {
    print(abs(N))
    exit(0)
}

@inline(__always)
func lowerBound(_ arr: [Int], _ target: Double) -> Int {
    var l = 0, r = arr.count
    while l < r {
        let m = (l + r) >> 1
        if Double(arr[m]) < target {
            l = m + 1
        } else {
            r = m
        }
    }
    return l
}

var best = Int.max

for i in cand {
    for j in cand {
        let ij = i * j
        let target = Double(N) / Double(ij)
        let idx = lowerBound(cand, target)

        if idx < cand.count {
            let k = cand[idx]
            let diff = abs(N - ij * k)
            if diff < best { best = diff }
        }
        if idx > 0 {
            let k = cand[idx - 1]
            let diff = abs(N - ij * k)
            if diff < best { best = diff }
        }

        if best == 0 {
            print(0)
            exit(0)
        }
    }
}

print(best)
