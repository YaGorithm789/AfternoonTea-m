let input = readLine()!.map { String($0) }
var hash = input.reduce(into: [String: Int]()) { $0[$1, default: 0] += 1 }
var result = ""
var mid = ""

if hash.values.filter { $0 % 2 != 0 }.count > 1 {
    print("I'm Sorry Hansoo")
} else {
    for key in hash.keys.sorted() {
        let stringCount = hash[key]! / 2
        
        if hash[key]! % 2 != 0 {
            mid = key
        }
        
        result += String(repeating: key, count: stringCount)
    }
    
    let reversedResult = String(result.reversed())
    result += mid + reversedResult
    print(result)
}
