let input = readLine()!.split(separator: " ").map { Int($0)! }
let (l, c) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map(String.init).sorted()
var password = [String]()
var isUsed = Array(repeating: false, count: c)
var result = ""
let aeiou = ["a", "e", "i", "o", "u"]

func back() {
    if password.count == l {
        var contain = 0
        
        for word in aeiou {
            if password.contains(word) {
                contain += 1
            }
        }
        
        if contain >= 1 && password.count - contain >= 2 {
            result += password.joined(separator: "") + "\n"
        }

        return
    }
    
    let last = password.last ?? "0"

    for i in 0..<c {
        guard isUsed[i] == false, last < arr[i] else { continue }
        
        isUsed[i] = true
        password.append(arr[i])
        back()
        isUsed[i] = false
        password.removeLast()
    }
}

back()
print(result)
