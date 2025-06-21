let N = readLine()!.map { String($0) }
var isU: Bool = false
var frontNums: [String] = []
var backNums: [String] = []
var index: Int = 0

for _ in 0..<N.count - 1 {
    index += 1
    var frontNum: String = ""
    
    for i in 0..<index {
        frontNum += N[i]
    }
    
    frontNums.append(frontNum)
    var backNum: String = ""
    
    for j in index..<N.count {
        backNum += N[j]
    }
    
    backNums.append(backNum)
}

for i in 0..<frontNums.count {
    let chFrontArray = frontNums[i].map { Int(String($0))! }
    let frontValue = chFrontArray.reduce(1, *)
    let chBackArray = backNums[i].map { Int(String($0))! }
    let backValue = chBackArray.reduce(1, *)
    
    if frontValue == backValue {
        isU = true
        break
    }
}

if isU {
    print("YES")
} else {
    print("NO")
}
