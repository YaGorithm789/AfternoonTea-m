let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var keychain = [String: String]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map(String.init)
    let site = input[0], password = input[1]
    keychain[site] = password
}

for _ in 0..<m {
    let site = readLine()!
    print(keychain[site]!)
}
