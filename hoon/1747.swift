import Foundation

var N = Int(readLine()!)!

while true {
    if isPrime(N) {
        if isPalindrome(String(N).map { String($0) }) {
            print(N)
            break
        }
    }
    
    N += 1
}

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    
    let end = Int(sqrt(Double(num)))
    
    for i in 2...end {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

func isPalindrome(_ numArray: [String]) -> Bool {
    let length: Int = numArray.count
    var flag: Bool = true

    for i in 0..<length / 2 {
        if numArray[i] != numArray[length - 1 - i] {
            flag = false
            break
        }
    }
    
    return flag
}
