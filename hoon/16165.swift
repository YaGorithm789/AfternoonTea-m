let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var group = [String: [String]]()
var member = [String: String]()

for _ in 0..<n {
    let groupName = readLine()!
    let number = Int(readLine()!)!
    
    for _ in 0..<number {
        let name = readLine()!
        group[groupName, default: []].append(name)
        member[name] = groupName
    }
}

for _ in 0..<m {
    let name = readLine()!
    let quiz = Int(readLine()!)!
    
    if quiz == 1 {
        print(member[name]!)
    } else {
        group[name]?.sorted().forEach { print($0) }
    }
}
