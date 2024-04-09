let n = Int(readLine()!)!
var hash = Set<String>()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map(String.init)
    
    if input[1] == "enter" {
        hash.insert(input[0])
    } else {
        hash.remove(input[0])
    }
}

hash.sorted(by: >).forEach {
    print($0)
}
