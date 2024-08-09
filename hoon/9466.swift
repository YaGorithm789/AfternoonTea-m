var Tcase = Int(readLine()!)!
var visit: [Bool] = []
var done: [Bool] = []
var cnt = 0

func dfs(_ arr:[Int], cur: Int) {
    var nextNode = arr[cur]
    visit[cur] = true
    
    if !visit[nextNode] {
        dfs(arr, cur: nextNode)
    } else {
        if !done[nextNode] {
            while nextNode != cur {
                cnt += 1
                nextNode = arr[nextNode]
            }
            
            cnt += 1
        }
    }
    
    done[cur] = true
}

for _ in 0..<Tcase {
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.insert(0, at: 0)
    cnt = 0
    visit = Array(repeating: false, count: n+1)
    done = Array(repeating: false, count: n+1)
    
    for i in arr {
        if !visit[i] {
            dfs(arr, cur: i)
        }
    }
    
    print(arr.count - cnt)
}
