let S = readLine()!.map { String($0) }

func dfs(_ left : Int , _ right : Int ) -> Int {
    var notNumberList = [Int]()
    var numberList = [Int]()
    var sum = 0
    
    for i in left..<right {
        if S[i] == "(" {
            notNumberList.append(i)
        } else if S[i] == ")" {
            let nextLeft = notNumberList.removeLast()
            
            if notNumberList.count == 0 {
                if numberList.count > 1 {
                    sum += numberList.count - 1 + ( numberList.last! * dfs(nextLeft + 1, i) )
                } else {
                    sum += ( numberList.last! * dfs(nextLeft+1, i) )
                }
                
                numberList.removeAll()
            }
        } else {
            if notNumberList.isEmpty {
                numberList.append(Int(S[i])!)
            }
        }
    }
    
    if numberList.isEmpty {
        return sum
    }else {
        return sum + numberList.count
    }
}

print(dfs(0, S.count))
