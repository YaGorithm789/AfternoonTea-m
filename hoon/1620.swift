let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var number = [Int: String]()
var name = [String: Int]()

for i in 1...n {
    let pokemon = readLine()!
    number[i] = pokemon
    name[pokemon] = i
}

for _ in 0..<m {
    let input = readLine()!
    
    if let id = Int(input) {
        print(number[id]!)
    } else {
        print(name[input]!)
    }
}
