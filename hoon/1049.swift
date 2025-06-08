let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var package = 1000
var single = 1000

for _ in 0..<nm[1] {
    let price = readLine()!.split(separator: " ").map { Int(String($0))! }
    package = min(package, price[0])
    single = min(single, price[1])
}

let po = package * (nm[0] / 6) + package
let so = single * nm[0]
let ps = package * (nm[0] / 6) + single * (nm[0] % 6)
print(min(po, so, ps))
