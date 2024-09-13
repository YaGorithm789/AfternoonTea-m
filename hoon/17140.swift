let n = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (r, c, k) = (n[0], n[1] ,n[2])
var A: [[Int]] = []

for _ in 1...3 {
    A.append(readLine()!.split(separator: " ").map{ Int(String($0))!} )
}

func operation() -> Int {
    var timer = 0
    
    while timer <= 100 {
        if r - 1 < A.count && c - 1 < A[0].count {
            if A[r - 1][c - 1] == k {
                return timer
            }
        }

        if A[0].count <= A.count {
            rOperation()
        } else {
            cOperation()
        }
        
        timer += 1
    }
    
    return -1
}

func rOperation() {
    var maxLength = 0
    
    for i in 0..<A.count {
        var dic: [Int:Int] = [:]
        
        for num in A[i] {
            if num == 0 { 
                continue
            }
            
            dic[num] == nil ? (dic[num] = 1) : (dic[num] = dic[num]! + 1)
        }
        
        A[i] = []

        for (key, value) in dic.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }) {
            if A[i].count >= 100 {
                break
            }
            
            A[i].append(contentsOf: [key, value])
        }
        
        maxLength = max(maxLength, A[i].count)
    }

    for i in 0..<A.count {
        A[i].append(contentsOf: Array(repeating: 0, count: maxLength - A[i].count))
    }
}

func cOperation() {
    var maxLength = 0
    var tempArr: [[Int]] = Array(repeating: [], count: A[0].count)
    
    for i in 0..<A[0].count {
        var dic: [Int:Int] = [:]
        
        for j in 0..<A.count {
            if A[j][i] == 0 { 
                continue
            }
            
            dic[A[j][i]] == nil ? (dic[A[j][i]] = 1) : (dic[A[j][i]]! = dic[A[j][i]]! + 1)
        }

        for (key, value) in dic.sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value < $1.value }) {
            tempArr[i].append(contentsOf: [key, value])
        }
        
        maxLength = max(maxLength, tempArr[i].count)
    }
    
    for i in 0..<tempArr.count {
        tempArr[i].append(contentsOf: Array(repeating: 0, count: maxLength - tempArr[i].count))
    }
    
    A = Array(repeating: [], count: tempArr[0].count)
    
    for i in 0..<tempArr.count {
        for j in 0..<tempArr[0].count {
            A[j].append(tempArr[i][j])
        }
    }
}

print(operation())
