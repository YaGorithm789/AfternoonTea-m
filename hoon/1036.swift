import Foundation

// ---------- Utilities ----------
@inline(__always) func charToVal(_ c: Character) -> Int {
    if let ascii = c.asciiValue {
        if ascii >= 48 && ascii <= 57 { return Int(ascii - 48) }          // 0-9
        if ascii >= 65 && ascii <= 90 { return Int(ascii - 55) }          // A-Z
    }
    return 0
}

@inline(__always) func valToChar(_ v: Int) -> Character {
    if v < 10 { return Character(UnicodeScalar(48 + v)!) }
    return Character(UnicodeScalar(55 + v)!) // 10->A
}

// ---------- BigNumber base-36 ----------
struct Big36: Comparable {
    static let base = 36
    var d: [Int] = []      // little-endian (LSB first)

    init() { d = [] }
    init(_ value: Int) {
        var v = value
        while v > 0 {
            d.append(v % Big36.base)
            v /= Big36.base
        }
    }
    init(fromBase36String s: String) {
        // store as digits LSB-first
        d = []
        for ch in s.reversed() {
            d.append(charToVal(ch))
        }
        normalize()
    }

    mutating func normalize() {
        var carry = 0
        for i in 0..<(d.count + 10) {
            if i == d.count { d.append(0) }
            let cur = d[i] + carry
            if cur >= 0 {
                d[i] = cur % Big36.base
                carry = cur / Big36.base
            } else {
                // not expected here, but keep safe
                let need = (abs(cur) + Big36.base - 1) / Big36.base
                d[i] = cur + need * Big36.base
                carry = -need
            }
            if carry == 0 && i >= d.count - 1 { break }
        }
        while d.last == 0 { d.removeLast() }
    }

    // a += b (same base)
    mutating func add(_ b: Big36) {
        if b.d.isEmpty { return }
        if d.count < b.d.count { d += Array(repeating: 0, count: b.d.count - d.count) }
        for i in 0..<b.d.count { d[i] += b.d[i] }
        normalize()
    }

    // a += small * (placed at offset index)
    mutating func addSmall(at index: Int, small: Int) {
        if small == 0 { return }
        if d.count <= index { d += Array(repeating: 0, count: index - d.count + 1) }
        d[index] += small
        normalize()
    }

    // a += small Big36 (small Int)
    mutating func addSmall(_ v: Int) {
        if v == 0 { return }
        if d.isEmpty { d = [0] }
        d[0] += v
        normalize()
    }

    func toString() -> String {
        if d.isEmpty { return "0" }
        var res = ""
        for x in d.reversed() { res.append(valToChar(x)) }
        return res
    }

    static func < (lhs: Big36, rhs: Big36) -> Bool {
        if lhs.d.count != rhs.d.count { return lhs.d.count < rhs.d.count }
        for (a, b) in zip(lhs.d.reversed(), rhs.d.reversed()) {
            if a != b { return a < b }
        }
        return false
    }
}

// ---------- Read Input ----------
let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
var numbers: [String] = []
numbers.reserveCapacity(n)

var maxLen = 0
for _ in 0..<n {
    let s = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
    numbers.append(s)
    maxLen = max(maxLen, s.count)
}
let k = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!

// ---------- Count digits per position ----------
var counts = Array(repeating: Array(repeating: 0, count: maxLen), count: 36)
// total sum
var total = Big36(0)

for s in numbers {
    // sum
    total.add(Big36(fromBase36String: s))
    // counts
    let chars = Array(s)
    let L = chars.count
    for i in 0..<L {
        let v = charToVal(chars[L - 1 - i]) // LSB at i
        counts[v][i] += 1
    }
}

// ---------- Compute deltas for each digit (0...35) ----------
struct DigitDelta {
    let digit: Int
    let delta: Big36
}

var deltas: [DigitDelta] = []
deltas.reserveCapacity(36)

for d in 0..<36 {
    if d == 35 {
        // already 'Z', no gain
        deltas.append(DigitDelta(digit: d, delta: Big36(0)))
        continue
    }
    let gainPerOccur = 35 - d
    var delta = Big36()
    // For each position i, we can add (gainPerOccur * count[d][i]) * 36^i,
    // In base-36, that's just adding to digit[i].
    for i in 0..<maxLen {
        let c = counts[d][i]
        if c > 0 {
            delta.addSmall(at: i, small: gainPerOccur * c)
        }
    }
    deltas.append(DigitDelta(digit: d, delta: delta))
}

// ---------- Pick top-K deltas ----------
deltas.sort { $0.delta > $1.delta }

// Some deltas can be zero; picking zero is harmless (no change).
let pick = min(k, 36)
for i in 0..<pick {
    total.add(deltas[i].delta)
}

// ---------- Output ----------
print(total.toString())
