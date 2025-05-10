let n = Int(readLine()!)!
let dice = readLine()!.split(separator: " ").map { Int($0)! }
let oneFaceMin = dice.min()!
var faceMin = [Int]()

faceMin.append(min(dice[0], dice[5]))
faceMin.append(min(dice[1], dice[4]))
faceMin.append(min(dice[2], dice[3]))
faceMin.sort()

let threeFaceMin = faceMin[0] + faceMin[1] + faceMin[2]
let twoFaceMin = faceMin[0] + faceMin[1]

if n == 1 {
    let diceSum = dice.reduce(0, +)
    print(diceSum - dice.max()!)
} else {
    print(threeFaceMin * 4 + twoFaceMin * (n - 1) * 4 + twoFaceMin * (n - 2) * 4 + oneFaceMin * (n - 1) * (n - 2) * 4 + oneFaceMin * (n - 2) * (n - 2))
}
