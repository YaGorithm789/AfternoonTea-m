let MX = 500 * 80 / 2
var next = 1
var tree = Array(repeating: [String: Int](), count: MX)

func insert(s: [String]) {
    var cur = 0

    for c in s {
        if tree[cur][c] == nil {
            tree[cur][c] = next
            next += 1
        }
        
        cur = tree[cur][c]!
    }
}

let n = Int(readLine()!)!

for _ in 0..<n {
    let path = readLine()!.split(separator: "\\").map(String.init)
    
    insert(s: path)
}

func show(dic: [String: Int], indent: Int) {
    for key in dic.keys.sorted() {
        print(String(repeating: " ", count: indent), key, separator: "")
        
        if let next = dic[key] {
            show(dic: tree[next], indent: indent + 1)
        }
    }
}

show(dic: tree[0], indent: 0)
