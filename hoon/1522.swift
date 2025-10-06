import Foundation

let s = readLine()!
let n = s.count
let arr = Array(s)
let aCount = arr.filter { $0 == "a" }.count

if aCount == 0 || aCount == n {
    print(0)
} else {
    let doubled = arr + arr
    var bInWindow = 0
    
    for i in 0..<aCount {
        if doubled[i] == "b" { bInWindow += 1 }
    }
    
    var answer = bInWindow
    
    if n > 0 {
        var i = 1
        
        while i <= n - 1 {
            if doubled[i - 1] == "b" { bInWindow -= 1 }
            if doubled[i + aCount - 1] == "b" { bInWindow += 1 }
            if bInWindow < answer { answer = bInWindow }
            i += 1
        }
    }
    
    print(answer)
}
