var n = Int(readLine()!)!

for _ in 0..<n {
    let mnxy = readLine()!.split(separator: " ").map{ Int($0)! }
    let gcd = mnxy[0] > mnxy[1] ? gcd(mnxy[0], mnxy[1]) : gcd(mnxy[1], mnxy[0])
    let maxYear = (mnxy[0] * mnxy[1]) / gcd
    var isinCal = false

    for i in 0..<maxYear / mnxy[0] {
        let year = i * mnxy[0] + mnxy[2]
        let y = year % mnxy[1] == 0 ? mnxy[1] : year % mnxy[1]

        if y == mnxy[3] {
            print(year)
            isinCal = true
            break
        }
    }

    if !isinCal {
        print(-1)
    }
}

private func gcd(_ n: Int, _ m: Int) -> Int {
    return m == 0 ? n : gcd(m, n%m)
}
