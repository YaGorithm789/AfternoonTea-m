var x = Int(readLine()!)!
var bitCount = 0

while x > 0 {
    x &= (x - 1)
    bitCount += 1
}

print(bitCount)
