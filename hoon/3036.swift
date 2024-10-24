let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var gcd = 0

func getGcd (_ a: Int, _ b: Int) -> Int {
	a % b == 0 ? b : getGcd(b, a % b)
}

for i in 1..<input.count {
	gcd = getGcd(input[0], input[i])
	print("\(input[0]/gcd)/\(input[i]/gcd)")
}
