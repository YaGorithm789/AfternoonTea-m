func solve() {
    let n = Int(readLine()!)!
    let dna = Array(readLine()!)
    var result = dna[n - 1]
    
    for i in (0..<n - 1).reversed() {
        result = decode(result, dna[i])
    }
    
    print(result)
}

func decode(_ a: Character, _ b: Character) -> Character {
    switch (a, b) {
    case ("A", "A"): return "A"
    case ("A", "G"), ("G", "A"): return "C"
    case ("A", "C"), ("C", "A"): return "B" // 문제 조건에 따라 B 또는 C로 처리
    case ("A", "T"), ("T", "A"): return "C"
    case ("G", "G"): return "G"
    case ("G", "C"), ("C", "G"): return "T"
    case ("G", "T"), ("T", "G"): return "A"
    case ("C", "C"): return "C"
    case ("C", "T"), ("T", "C"): return "G"
    case ("T", "T"): return "T"
    default: return " " // 에러 처리
    }
}

solve()
