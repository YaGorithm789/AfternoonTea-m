var sales = [String: Int]()
let N = Int(readLine()!)!

for _ in 0..<N {
    let book = readLine()!
    
    if sales.keys.contains(book) {
        sales[book]! += 1
    } else {
        sales[book] = 1
    }
}

var bestSellers = [String]()
let bestSale = sales.values.max()!

for book in sales {
    if book.value == bestSale {
        bestSellers.append(book.key)
    }
}

print(bestSellers.sorted()[0])
