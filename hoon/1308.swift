let numOfDay = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]

func checkLeapYear(_ year: Int) -> Bool {
	if year % 400 == 0 { return true }
	if year % 100 == 0 { return false }
	if year % 4 == 0 { return true }
    
	return false
}

func totalDay(_ dateStr: String) -> Int {
	let date = dateStr.split { $0 == " " }.map { Int($0)! }
	var day = 0
    
	for y in 1...date[0] {
		if y == date[0] {
			day += numOfDay[0..<date[1]].reduce(0, +)
			day += date[2]
            
			if checkLeapYear(y) && date[1] > 2 { day += 1 }
		} else {
			day += checkLeapYear(y) ? 366 : 365
		}
	}
    
	return day
}

let now = totalDay(readLine()!)
let dday = totalDay(readLine()!)
let interval = dday - now
print(interval >= 365243 ? "gg" : "D-\(interval)")
