// Day 1



// Create consts and var
// var = create a new variable
// call a var a descriptive name
var hiThere = "Hi" + " there"


// let = create a new constant
// cant ever change
let name = "David"

// var can change freely
var playerName = "Roy"
print(playerName)

playerName = "Bob"
print(playerName)

playerName = "Shenan"
print(playerName)




// All strings start and end with " "
let energyVampire = "Colin Robinson"
let fileName = "paris.png"
let quote = "And then there \"No and then there was light! \""
let movie = """
Hello
World
"""

let nameLength = fileName.count
print(nameLength)
print(quote.hasPrefix("And"))



// whole numbers
// Int
let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let squaredScore = score * score
let halvedScore = score / 2
let doubledScore = score * 2

var counter = 10
counter += 5
print(counter)
counter *= 2
counter -= 2
counter /= 2
print(counter)


let number = 120
print(number.isMultiple(of:3)) // is it a multiple of: x?
print(120.isMultiple(of: 3))




// decimal numbers
// double precision floating point number
// swift considers them entirely different numbers
// Double
let number2 = 0.1 + 0.2
print(number2)


let a = 1
let b = 2.0
let c = a + Int(b)
print(c)


let double1 = 3.1
let double2 = 32.32
let double3 = 3.0
let int1 = 3

// var name = "Nicholas Cage" // ASSIGNED STR CANN)T BE INT
// name = "John Travolta"
// name = 57

var rating = 5.0
rating += 2 // assumes is a double
print(rating)



// cannot not mix an INT and DOUBLE as DOUBLEs are such prescise numbers


