extension String {
    subscript(i: Int) -> Character {
        var offset = i
        
        while offset < 0 { 
            offset += count 
        }
        
        let index = self.index(startIndex, offsetBy: offset)
        
        return self[index]
    }
}

let inputs = readLine()!.split(separator: " ").map { String($0) }
let str1 = inputs[0]
let str2 = inputs[1]
var result = Int.max

for k in 0...str2.count - str1.count {
    var diff = 0
    
    for i in 0..<str1.count {    
        if str1[i] != str2[i + k] { 
            diff += 1 
        }
    }
    
    result = min(result, diff)
}

print(result)
