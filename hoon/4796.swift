var count = 1

while let lpv = readLine()?.split(separator: " ").map({ Int($0)! }),
      lpv != [0, 0, 0] {
    let (l, p, v) = (lpv[0], lpv[1], lpv[2])
    
    print("Case \(count): \((v / p) * l + min(l, v % p))")
    count += 1
}
