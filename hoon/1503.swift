import Foundation

// --- 입력 ---
guard let nLine = readLine(), let N = Int(nLine.trimmingCharacters(in: .whitespacesAndNewlines)) else {
    exit(0)
}
guard let mLine = readLine(), let M = Int(mLine.trimmingCharacters(in: .whitespacesAndNewlines)) else {
    exit(0)
}

var banned = Set<Int>()
if M > 0, let line = readLine() {
    for s in line.split(separator: " ") {
        if let v = Int(s) { banned.insert(v) }
    }
}

// --- 사용 가능한 수 목록 (1...1000) ---
var cand = [Int]()
cand.reserveCapacity(max(0, 1000 - M))
for v in 1...1000 where !banned.contains(v) {
    cand.append(v)
}
if cand.isEmpty {
    print(abs(N))
    exit(0)
}

// --- lowerBound (target 이상 첫 인덱스, Double 타겟) ---
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

// --- 두 수는 이중 루프, 마지막 한 수는 이분 탐색으로 근사 ---
var best = Int.max

for i in cand {
    for j in cand {
        let ij = i * j
        let target = Double(N) / Double(ij)
        let idx = lowerBound(cand, target)

        if idx < cand.count {
            let k = cand[idx]
            best = min(best, abs(N - ij * k))
        }
        if idx > 0 {
            let k = cand[idx - 1]
            best = min(best, abs(N - ij * k))
        }

        if best == 0 {
            print(0)
            exit(0)
        }
    }
}

print(best)
