// Day 5


// how to check if a condition is true or false

var someCondition = true
someCondition = false
if someCondition {
    print("Do Something")
    print("Do Something Else")
    print("Do this also")
}

let score = 85
if score > 80 {
    print("Good job!")
}


let speed = 88
let percentage = 85
let age = 18
if speed >= 88 {
    print("Where we are going we don't need roads")
}
if percentage < 85 {
    print("Failed")
}
if age >= 18 {
    print("You can vote!")
}


let ourName = "David"
let friendName = "Bob"
if ourName < friendName {
    print("It's \(ourName) vs \(friendName))")
}
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}


var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)


let country = "USA"
if country == "Canada" {
    print("Soory")
}


let name = "Taylor"
if name != "Anon" {
    print("Hello, \(name)")
}


var userName: String = ""
if userName.isEmpty { // because if userName.isEmpty == true is implied
    userName = "Anon"
}
print("Welcome \(userName)")


// making enums comparable
//
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)




// How to check for multiple conditions
let age = 16
if age >= 18 {
    print("You can vote!")
} else { // if the condition is not true this will run
    print("You cannot vote!")
}


var a = false
var b = false
if a {
    print("I am an A")
} else if b {
    print("I am a B")
} else {
    print("I am not A or B!")
}


let temp = 72
if temp > 70 && temp < 76 { // AND
    print("Have a nice day!")
}


let userAge = 14
let hasConsent = true
if age >= 18 || hasConsent { // OR
    print("You can buy the game!")
}


enum TransportOption {
    case plane, heli, bike, car, scooter
    
}
let transport: TransportOption = TransportOption.plane
if transport == .plane || transport == .heli {
    print("Flyyyy")
} else if transport == .bike {
    print("Bike paths exists sometimes!")
} else if transport == .car {
    print("Traffic sucks..")
} else {
    print("Scooter time!")
}



// How to use switch statements to check multipe conditions

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun
if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .snow {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}


switch forecast { // when forecast (which = Weather.sun) is checked against these values
case .sun:
    print("Nice day!")
case .rain:
    print("WET!")
case .wind:
    print("AHH TORNADO")
case .snow:
    print("No school!")
case .unknown:
    print("Uh oh! Broken.")
}


// using default
// default will always run first (when placed first)
let place = "Metropolis"
switch place {
case "Gotham":
    print("Batman")
case "MegaCity One":
    print("Judge Dredd")
case "Wakanda":
    print("Black Panther")
default:
    print("Who are you?")
}


// using falltrhough
let day = 3
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}



// How to use Ternary Conditional Operators for quick tests
// operates on 3 pieces of data
// lets us check a condition and return a value depending
// sometimes we have no choice but to use a ternary with SwiftUI

let age = 18
let canVote = age >= 18 ? "Yes" : "No"
// is age >= 18
// ? condtion true
// : condition not true
print(canVote)

// W T F
// What are we checking?
// True ?
// False :

let hour = 23
print(hour > 12 ? "It's before noon" : "It's afternoon")


let names = ["Jane", "Mal", "Bob"]
let crewCount = names.isEmpty ? "No One" : "\(names.count) people"
print(crewCount)


enum Theme {
    case light, dark
}
let theme = Theme.dark
let backGround = theme == .dark ? "black" : "white"
print(backGround)


