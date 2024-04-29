let n = Int(readLine()!)!
var lc = Array(repeating: 0, count: n + 1)
var rc = Array(repeating: 0, count: n + 1)
var result = ["", "", ""]

for _ in 0..<n {
    let plr = readLine()!.split(separator: " ").map(String.init)
    let p = plr[0], l = plr[1], r = plr[2]
    let parent = Int(UnicodeScalar(p)!.value) - 64
    if l != "." { lc[parent] = Int(UnicodeScalar(l)!.value) - 64 }
    if r != "." { rc[parent] = Int(UnicodeScalar(r)!.value) - 64 }
}

func preorder(cur: Int) {
    result[0] += UnicodeScalar(cur + 64)!.description
    
    if lc[cur] != 0 { preorder(cur: lc[cur]) }
    if rc[cur] != 0 { preorder(cur: rc[cur]) }
}

func inorder(cur: Int) {
    if lc[cur] != 0 { inorder(cur: lc[cur]) }
    
    result[1] += UnicodeScalar(cur + 64)!.description
    
    if rc[cur] != 0 { inorder(cur: rc[cur]) }
}

func postorder(cur: Int) {
    if lc[cur] != 0 { postorder(cur: lc[cur]) }
    if rc[cur] != 0 { postorder(cur: rc[cur]) }
    
    result[2] += UnicodeScalar(cur + 64)!.description
}

preorder(cur: 1)
inorder(cur: 1)
postorder(cur: 1)
result.forEach { print($0) }
