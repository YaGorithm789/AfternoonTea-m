import Foundation

func solve() {
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var s = Int(readLine()!)!

    for i in 0..<n {
        if s == 0 {
            break
        }
      
        var maxIndex = i
      
        for j in i + 1..<min(i + 1 + s, n) {
            if arr[j] > arr[maxIndex] {
                maxIndex = j
            }
        }
      
        for j in stride(from: maxIndex, to: i, by: -1) {
            arr.swapAt(j, j - 1)
            s -= 1
        }
    }
  
    print(arr.map { String($0) }.joined(separator: " "))
}

solve()
