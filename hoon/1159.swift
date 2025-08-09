var mapping = [Character: Int]()

for _ in 0..<Int(readLine()!)! {
    let player = readLine()!.first!
    
    if mapping[player] != nil {
        mapping[player]! += 1
    } else {
        mapping[player] = 1
    }
}

let list = mapping
    .filter { $0.value >= 5 }
    .keys
    .sorted(by: <)
    .map { String($0) }
    .joined(separator: "")

print(list == "" ? "PREDAJA" : list)
