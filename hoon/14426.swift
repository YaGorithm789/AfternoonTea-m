let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let root = 1
var unused = 2
let MX = 10000 * 500 + 5
var next = Array(repeating: Array(repeating: -1, count: 26), count: MX)
var result = 0

func s2i(_ s: String) -> Int {
    return Int(UnicodeScalar(s)!.value) - 97
}

func insert(s: [String]) {
    var cur = root
    
    for c in s {
        let index = s2i(c)
        
        if next[cur][index] == -1 {
            next[cur][index] = unused
            unused += 1
        }
        
        cur = next[cur][index]
    }    
}

func find(s: [String]) -> Bool {
    var cur = root
    
    for c in s {
        let index = s2i(c)
        
        if next[cur][index] == -1 {
            return false
        }
        
        cur = next[cur][index]
    }
    
    return true
}

for _ in 0..<n {
    let input = readLine()!.map(String.init)
    
    insert(s: input)
}

for _ in 0..<m {
    let input = readLine()!.map(String.init)
    
    result += find(s: input) ? 1 : 0
}

print(result)
