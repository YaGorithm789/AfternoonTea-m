let N = Int(readLine()!)!
let list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var count = 0
var answer = -1
var answers = [0]

func search(_ selected : [Int]) {
    if !selected.isEmpty {
        answers.append(Int(selected.reduce("", { $0 + String($1) }))!)
    }
    
    for num in list {
        if selected.isEmpty {
            if num != 0 {
                count += 1
                search([num])
            }
        } else {
            if selected.last! > num {
                count += 1
                search(selected + [num] )
            }
        }
    }
}

search([])
answers.sort()

if answers.count <= N {
    print(-1)
} else {
    print(answers[N])
}
