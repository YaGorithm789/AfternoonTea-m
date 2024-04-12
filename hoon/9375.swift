let t = Int(readLine()!)!

for _ in 0..<t {
    var item = [String: [String]]()
    let n = Int(readLine()!)!
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map(String.init)
        
        item[input[1], default: []].append(input[0])
    }
    
    print(item.values.reduce(1) { $0 * ($1.count + 1) } - 1)
}
