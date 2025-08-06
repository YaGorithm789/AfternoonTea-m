import Foundation

func solve() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let l = input[0]
    let r = input[1]
    let lStr = String(l)
    let rStr = String(r)
    var count = 0
  
    if lStr.count != rStr.count {
        print(0)
        return
    }
  
    for i in 0..<lStr.count {
        if lStr[lStr.index(lStr.startIndex, offsetBy: i)] == rStr[rStr.index(rStr.startIndex, offsetBy: i)] {
            if lStr[lStr.index(lStr.startIndex, offsetBy: i)] == "8" {
                count += 1
            }
        } else {
            break
        }
    }
    
    print(count)
}

solve()
