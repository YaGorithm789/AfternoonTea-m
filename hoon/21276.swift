let n = Int(readLine()!)!
var people = readLine()!.split(separator: " ").map(String.init)
let m = Int(readLine()!)!
var dic = [String: [String]]()
var deg = [String: Int]()
var child = [String: [String]]()

for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map(String.init)
    let x = xy[0], y = xy[1]
    
    dic[y, default: []].append(x)
    deg[x, default: 0] += 1
}

var queue = people.filter { deg[$0, default: 0] == 0 }.sorted()

var result = ""
result += "\(queue.count)\n"
result += "\(queue.joined(separator: " "))\n"

while queue.isEmpty == false {
    let cur = queue.removeFirst()
    
    guard let ances = dic[cur] else {
        child[cur] = []
        continue
    }
    
    for next in ances {
        deg[next]! -= 1
        
        if deg[next] == 0 {
            queue.append(next)
            child[cur, default: []].append(next)
        }
    }
}

child.keys.sorted().forEach {
    result += "\($0) \(child[$0]?.count ?? 0) \(child[$0]?.sorted().joined(separator: " ") ?? "")\n"
}

print(result)
