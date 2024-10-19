let arr = readLine()!.split(separator: " ").map{ Int($0)! }
var i = 1
var E = 1
var S = 1
var M = 1

while true {
    if E > 15 {
        E = 1
    }
    
    if S > 28 {
        S = 1
    }
    
    if M > 19 {
        M = 1
    }
    
    if E == arr[0] && S == arr[1] && M == arr[2] {
        break
    }
    
    i += 1
    E += 1
    S += 1
    M += 1
}

print("\(i)")
