let N = Int(readLine()!)!
var sn = [String](repeating: "", count: N)

for i in 0..<N {
    sn[i] = readLine()!
}

for i in 0...sn[0].count {
    var set = Set<String>()
    let start = sn[0].index(sn[0].endIndex, offsetBy: -i)
    
    for j in 0..<N {
        set.insert(String(sn[j][start...]))
    }
    
    if set.count == N {
        print(i)
        break
    }
}
