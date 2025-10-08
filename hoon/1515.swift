import Foundation

let s = Array(readLine()!)
var idx = 0
var i = 0

while idx < s.count {
    i += 1
    let digits = Array(String(i))
    var j = 0
    
    while j < digits.count && idx < s.count {
        if digits[j] == s[idx] {
            idx += 1
        }
        
        j += 1
    }
}

print(i)
