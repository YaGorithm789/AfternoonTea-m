var str = Array(readLine()!).map { String($0) }
let n = str.count
str.insert("0", at: 0)
var alphabet = ["."]
var dp = Array(repeating: 0, count: str.count + 1)
var chan = true
dp[0] = 1

for i in 65...90 {
    alphabet.append(String(UnicodeScalar(UInt32(i))!))
}

for i in 1..<str.count {
    if i == 1 {
        if Int(str[i])! == 0 {
            dp[n] = 0
            break
        } else {
            dp[i] = 1
        }
        
        continue
    }
    
    if str[i] == "0" {
        if str[i - 1] == "0" || Int(str[i - 1])! > 2 {
            dp[n] = 0
            break
        }
    } else {
        dp[i] = (dp[i] + dp[i - 1]) % 1000000
    }

    if Int(str[i - 1] + str[i])! <= 26 && Int(str[i - 1] + str[i])! >= 10 {
        dp[i] = (dp[i] + dp[i - 2]) % 1000000
    }
}

print(dp[n])
