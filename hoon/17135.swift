let inp  = readLine()!.split(separator: " ").map{ Int(String($0))! }
let row = inp[0], col = inp[1], Dist = inp[2]
var mx = 0
var arr = [[Int]]()
var path = [Int]()

for _ in 0..<row {
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

func combination(_ idx: Int) {
    if path.count == 3 {
        start()
    } else {
        for i in idx..<col {
            path.append(i)
            combination(i + 1)
            path.removeLast()
        }
    }
}

func attack(_ pos: (Int, Int), _ arr: [[Int]], _ check: inout [[Bool]]){
    var possible = [(Int, Int)]()
    
    for i in 0..<row {
        for j in 0..<col {
            if arr[i][j] == 1 && abs(i - pos.0) + abs(j - pos.1) <= Dist {
                possible.append((i, j))
            }
        }
    }
    
    possible.sort { (le, re) in
        let ledist = abs(le.0 - pos.0) + abs(le.1 - pos.1)
        let redist = abs(re.0 - pos.0) + abs(re.1 - pos.1)
                   
        if ledist == redist {
            return le.1 < re.1
        } else {
            return ledist < redist
        }
    }
    
    guard let first = possible.first else { return }
    
    check[first.0][first.1] = true
}

func isEmpty(_ arr: [[Int]]) -> Bool  {
    for i in 0..<row {
        for j in 0..<col {
            if arr[i][j] == 1 { return false }
        }
    }
    return true
}

func removeEnemy(_ arr: inout [[Int]], _ check: [[Bool]], _ kill: inout Int) {
    for i in 0..<row {
        for j in 0..<col {
            if check[i][j] {
                arr[i][j] = 0
                kill += 1
            }
        }
    }
}

func moveNextLine(_ arr: inout [[Int]]) {
    for i in (1..<row).reversed() {
        for j in 0..<col {
            arr[i][j] = arr[i - 1][j]
        }
    }
    
    for i in 0..<col {
        arr[0][i] = 0
    }
}

func resetCheckArr(_ check: inout [[Bool]]) {
    check = Array(repeating: Array(repeating: false, count: col), count: row)
}

func start() {
    var arr = arr
    var kill = 0
    var check = Array(repeating: Array(repeating: false, count: col), count: row)
    
    while !isEmpty(arr) {
        path.forEach{ attack((row, $0), arr, &check) }
        removeEnemy(&arr, check, &kill)
        moveNextLine(&arr)
        resetCheckArr(&check)
    }
    
    mx = max(kill,mx)
}

combination(0)
print(mx)
