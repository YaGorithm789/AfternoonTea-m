class Node {
    let num: Int
    var parentNum: Int = 0
    var depth = 0
    
    init(num: Int) {
        self.num = num
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var tree = [Node]()
    
    for i in 0...n {
        tree.append(Node(num: i))
    }
    
    for _ in 0..<n - 1 {
        let l = readLine()!.split(separator: " ").map { Int(String($0))! }
        tree[l[1]].parentNum = l[0]
    }
    
    let nodes = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (n1, n2) = (tree[nodes[0]], tree[nodes[1]])
    
    var t1 = n1
    while t1.parentNum != 0 {
        t1 = tree[t1.parentNum]
        n1.depth += 1
    }
    
    var t2 = n2
    while t2.parentNum != 0 {
        t2 = tree[t2.parentNum]
        n2.depth += 1
    }
    
    let flag = n1.depth < n2.depth
    for _ in 0..<abs(n1.depth - n2.depth) {
        if flag {
            n2 = tree[n2.parentNum]
        } else {
            n1 = tree[n1.parentNum]
        }
    }
    
    while n1.num != n2.num {
        n1 = tree[n1.parentNum]
        n2 = tree[n2.parentNum]
    }
    
    print(n1.num)
}
