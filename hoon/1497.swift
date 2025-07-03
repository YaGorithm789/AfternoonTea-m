let inp = readLine()!.split(separator: " " ).map { Int(String($0))! }
let N = inp[0], M = inp[1]
var list = [Int]()
var tempt = [Int]()
var ans = 0
var count = 0

for _ in 0..<N {
    let q = readLine()!.split(separator: " ").map { String($0) }
    list.append(Int(q[1].map { $0 == "Y" ? String(1) : String(0) }.joined(), radix: 2)!)
}

func combination(_ idx: Int, _ mx: Int) {
    if tempt.count == mx {
        var x = tempt.reduce(0, { $0 | $1 })
        var clear = 0
        
        while x > 0 {
            clear += 1
            x &= x - 1
        }
        
        if clear >= ans {
            if clear > ans {
                count = mx
            } else {
                count = min(count, mx)
            }
            
            ans = clear
        }
        
        return
    }
    
    for i in idx..<N {
        tempt.append(list[i])
        combination(i + 1, mx)
        tempt.removeLast()
    }
}

for i in 1...N {
    combination(0, i)
}

print(ans == 0 ? -1 : count)
