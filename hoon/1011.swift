import Foundation

let input1 = Int(readLine()!)!
var k = 0

for i in 1...input1 {
    let input2 = readLine()!.split(separator: " ").map{ Int($0)! }
    var dis = input2[1] - input2[0]
    var sqrt = sqrt(Double(dis))
    var count = 0
    
    if Int(sqrt) < Int(ceil(sqrt)) {
        count = Int(sqrt * 2)
    } else {
        count = Int(sqrt * 2 ) - 1
    }
    
    print(count)
}
