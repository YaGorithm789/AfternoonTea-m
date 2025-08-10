import Foundation

func solve() {
    let input = readLine()!.split(separator: " ").map { Double(String($0))! }
    let n = Int(input[0])
    let l = input[1]
    let w = input[2]
    let h = input[3]

    var start: Double = 0
    var end: Double = min(l, w, h)
    var result: Double = 0

    for _ in 0..<100 { // 충분히 반복
        let mid = (start + end) / 2
        let count = floor(l / mid) * floor(w / mid) * floor(h / mid)

        if count >= Double(n) {
            start = mid
            result = mid
        } else {
            end = mid
        }
    }

    print(String(format: "%.10f", result))
}

solve()
