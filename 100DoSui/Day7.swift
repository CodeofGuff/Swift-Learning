// Day7

// How to write functions, how to accept parameters, and how to return data. 


// use functions to wrap repeatable code
// when a func is complete the code is 'destroyed'
func showWelcome () {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

var user = true
if user {
    showWelcome()
} else {
    print("Error")
}


let num = 140
if num.isMultiple(of: 2) {
    print("even")
} else {
    print("odd")
}

func printTimesTables(number: Int, number2: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
    for i in 1...5 {
        print("\(i) * \(number2) is \(i * number2)")
    }
}

printTimesTables(number: 2, number2: 1, end: 3)



// Return values from funcstions
// Cocoa func sqrt()
let root = sqrt(12)
print("root")


func rollDice6() -> Int {
    return Int.random(in: 1...6)
}
func rollDice10() -> Int {
    return Int.random(in: 1...10)
}
let result6 = rollDice6()
let result10 = rollDice10()
print("You rolled a \(result6) with your D6, and a \(result10) with your D10")


func name(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}
name(string1: "David", string2: "David")

func name2(string1: String, string2: String) -> String {
    if string1.sorted() == string2.sorted() {
        return "They match!"
    } else {
        return "They do not match!"
    }
}
name2(string1: "David", string2: "David")


//Pythag
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}
let c = pythagoras(a: 3, b: 4)
print(c)

// ReWritten in one line
func pythagoras2(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
let c2 = pythagoras(a: 3, b: 4)
print(c2)


func sayHello() {
    return // if empty the return will force to exit the func, force exits regardless
}


// Reutrn multiple values from functions
// Using tuples to put multiple values into a single var/const
// Why use Tuples over Dictionaries???
// swift doesn't know ahead of time if dict keys are present
// swift knows tuple values will be there
// access values using var.tupleParam
// dict may contain tons of values, we arn't sure

func getuser() -> (firstName: String, lastName: String, age: Int) {
    ("David", "Guffre", 34)
}
let user = getuser()
print("Name: \(user.firstName) \(user.lastName), Age: \(user.age)")

// OR

func getuser2() -> (String, String, Int) {
    ("David", "Guffre", 34)
}
let user2 = getuser2()
print("Name: \(user2.0) \(user2.1), Age: \(user2.2)")

// OR

func getuser3() -> (firstName: String, lastName: String, age: Int) {
    ("David", "Guffre", 34)
}
let (firstName, lastName, age) = getuser3() // destrucuring, pulling the returned tuple into 2 consts
print("Name: \(firstName) \(lastName), Age: \(age)")



// Arrays keep the order and can have duplicates
// Sets are unordered and can’t have duplicates
// Tuples have a fixed number of values of fixed types inside them.


// how to customize Param labels
func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    return rolls
}
let rolls = rollDice(sides: 6, count: 4)
print(rolls)

// Swift lets you have mulipl funcs of the same name, with diff params. 
func hireEmp(name: String){}
func fireEmp(title: String){}
func hireEmp(address: String){}


//Different Param names
func isUpperCase(_ string: String) -> Bool { // added an underscore to ommit argument name in result =
    string == string.uppercased()
}
let string = "HELLO WORLD"
let result = isUpperCase(string)



func printTimesTable(for num: Int) { // can use 'for' to define the external param
    for i in 1...3 {
        print("\(i) * \(num) is \(i * num)") // num is the internal param name
    }
}
printTimesTable(for: 5) // external param name



// The main reason for skipping a parameter name is when your function name is a verb and the first parameter is a noun the verb is acting on. For example:
// Greeting a person would be greet(taylor) rather than greet(person: taylor)
// Buying a product would be buy(toothbrush) rather than buy(item: toothbrush)
// This is particularly important when the parameter label is likely to be the same as the name of whatever you’re passing in:
// Singing a song would be sing(song) rather than sing(song: song)
// Enabling an alarm would be enable(alarm) rather than enable(alarm: alarm)
