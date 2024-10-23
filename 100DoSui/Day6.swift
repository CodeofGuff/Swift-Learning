// Day 6



// How to use for loops for repeat work


// Loop interation (4 here)
// Loops through the first index and then to the next, and then the next.
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for i in platforms {
    print("Swift works great on \(i).")
}


// Xcode auto completion 'platform' as it sees platforms is plural
for platform in platforms {
}


for i in 1...12 { // ranges are a unique data type
    print("5 x \(i) is \(5 * i)")
}


// Nested loops
for n in 1...5 {  //
    print("The \(n) times table")
    
    for m in 1...5 { // nested loop to count "through 5"
        print("  \(m)  x  \(n) = \(m * n)")
    }
    print() // breaks up the lines to look nicer
}


for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}
for i in 0..<5 {
    print("Counting up to (but not including) 5: \(i)")
}

var number: [Int] = []
for i in 1...5 {
    if i != 0  {
        number.append(i)
        number.append(0)
    } else {
        number.removeAll()
    }
    print()
}
print(number)


// Let's try this folloow for loop with a ().map {}
var numbers: [Int] = []
for m in 1...5 {
    let ms = m * 2
    print(ms)
    numbers.append(ms)
}
print(numbers)

// Written with .map where $0 will take each arg the countableClosedRange 1...5
let numbersv2 = (1...5).map { $0 * 2 }
print(numbersv2)



// Loop var can be replaced by _
var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)



// How to use a while loop to repeat work


// While the variable is true, the code will execute
// Usefull when you need a custom condition

var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Blast off!")


// random(in: ) works on Int or Doubles

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)
var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")



var number = 10
if number % 2 == 0 {
    print("Is even")
} else if number % 2 != 0 {
    print("Is odd")
} else {
    print("Shit")
}

var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}




// How to skip loops with continue and break

// Continues the code if conditions are not met
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found pictue: \(filename)")
}



// Break will make Swift exit the loop right away
let number1 = 4
let number2 = 14
var multiples: [Int] = []

for ms in 1...100_000 {
    if ms.isMultiple(of: number1) && ms.isMultiple(of: number2) {
        multiples.append(ms)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)



// outerLoop
// Used to break nested loops!

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: 
for o1 in options {
    for o2 in options {
        for o3 in options {
            print("In loop")
            let attempt = [o1, o2, o3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}
