import Foundation

let lwh = readLine()!.split(separator: " ").map { Int(String($0))! }
let l = lwh[0], w = lwh[1], h = lwh[2]
let N = Int(readLine()!)!
var C = [(Int, Int)]()
var A = 0
var T = true

for _ in 0..<N {
    let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
    C.append((Int(pow(2, Double(AB[0]))), AB[1]))
}

C.sort(by: { $0.0 > $1.0 })

func box(_ L: Int, _ W: Int, _ H: Int, _ I: Int) {
    if L == 0 || W == 0 || H == 0 {
        return
    }
    
    for i in I..<N {
        if L >= C[i].0 && W >= C[i].0 && H >= C[i].0 && C[i].1 > 0 {
            A += 1
            C[i].1 -= 1
            box(L - C[i].0, W, H, i)
            box(C[i].0, W - C[i].0, H, i)
            box(C[i].0, C[i].0, H - C[i].0, i)
            
            return
        }
    }
    
    T = false
}

box(l, w, h, 0)

if !T {
    print(-1)
} else {
    print(A)
}
