var plus = [Int]()
var minus = [Int]()
var result: Int = 0

for _ in 0..<Int(readLine()!)! {
    let input = Int(readLine()!)!
  
    if input > 1 { 
        plus.append(input)
    } else if input == 1 {
        result += 1
    } else {
        minus.append(input)
    }
}

plus.sort(by: > )
minus.sort(by: < )

if plus.count % 2 == 1 { result += plus.removeLast() }
if minus.count % 2 == 1 { result += minus.removeLast() }

while plus.count > 0 || minus.count > 0 {
    if plus.count > 0 { result += plus.removeLast() * plus.removeLast() }
    if minus.count > 0 { result += minus.removeLast() * minus.removeLast() }
}

print(result)
