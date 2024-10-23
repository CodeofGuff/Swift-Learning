// Day 2



// Booleans
// Booleans are true or false


let filename = "paris.jpg"
print(filename.hasSuffix(".jpg")) // hasSuffix or is does, true or false

let number = 120
print(number.isMultiple(of: 3)) //


let goodCat = true

var gameOver = false
print(gameOver)
gameOver.toggle() // same as !gameOver
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !false
print(isAuthenticated)



// String interpolation
let firstPart = "Hello, "
let secondPart = "world!"
let greet = firstPart + secondPart

let greeting = firstPart + "to the " + secondPart

let luggageCode = "1" + "2" + "3" + "4"+"5"
 // adds it like "12" then "123" then "1234" then "12345"

let quote = "The luggage code is \(luggageCode)"

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I am \(age) years old"
print(message)


print("5x 5 is \(5 * 5)")



