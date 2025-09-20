import Foundation

while true {
    guard let line = readLine() else { break }
    
    let inputs = line.split(separator: " ").map { Int($0)! }
    var a = inputs[0]
    var d = inputs[1]
    var result = 0

    if a == 0 && d == 0 {
        break
    }
    
    for _ in 0..<d {
        result += a * Int(pow(2.0, Double(d)))
        d -= 1
    }
    
    result += a
    print(result)
}
