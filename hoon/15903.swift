let info = readLine()!.split(separator: " ").map { Int(String($0))! }
var card = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = 0

card.sort(by: >)

for _ in 0..<info[1] {
    let tmp = card[card.count - 1] + card[card.count - 2]
    card[card.count - 1] = tmp
    card[card.count - 2] = tmp
    card.sort(by: >)
}

for i in card { answer += i }

print(answer)
