let inputs = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n, r, c) = (inputs[0], inputs[1], inputs[2])

func solution(_ n: Int, _ r: Int, _ c: Int) -> Int {
    guard n > 0 else { return 0 }
    return 2 * (r % 2) + (c % 2) + 4 * solution(n - 1, r / 2, c / 2)
}

print(solution(n, r, c))
