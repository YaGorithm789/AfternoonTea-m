for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split { $0 == " " }.map { Int($0)! }
    var n = 1
    
    for _ in 0..<ab[1] {
        n = n * ab[0] % 10
    }
    
    print(n == 0 ? 10 : n)
}
