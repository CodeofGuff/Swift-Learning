// Day 3



// 
// Array - Stores ordered data
// Arrays can only hold one type of Data

var beatles = ["John", "Paul", "George", "Ringo"] // String
let numbers = [4, 5, 6, 7, 8] // Int
var temps = [25.3, 45.6, 34,2] // Double


print("The temp in this place is \(temps[2])°")

beatles.append("David")
print(beatles)


var scores = Array<Int>() // or [Int]()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])


var albums = [String]()
albums.append("Test")
albums.append("Folklore")
albums.append("Fearless")
print(albums)

var chars = ["Lana", "Jimmy", "Ted", "Sally"]  //Swift knows its an Array
chars.append("Fred")
print(chars.count)
print(chars)
chars.remove(at: 2)
print(chars)


let bondMovies = ["Casino", "Spectre", "Time Die"]
print(bondMovies.contains("Frozen"))


let cities = ["New York", "LA", "Bend", "Seattle"]
print(cities.sorted()) 
// sorted() func sorts Ints, Strings, etc by lowest value ot highest or alphabetically.




// Store and find data in Dictionaries
// Example Array
var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("Location: \(employee[2])")

// Arrays store items as index inside of itself.
// Dictionaries allow us to store and name the data.
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

// Key:Values
// if trying to reference a value through a key that doesnt exist it creates an optional
// print(employee2["name"]) // prints Optional("Taylor Swift") as it knows it is only an option that the data is there

// To avoid this we define a default value
// , default:

print(employee2["name", default: "Unknown"])


let hasGrad = [
    "Eric": false,
    "Otis": false,
    "Bob": true
    ]
print(hasGrad["Eric", default: true])

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro"
    ]
print(olympics[2012, default: "Unknown"])


var heights = [String: Int]() // variable[key] = value
heights["Trevor"] = 52
heights["Bob"] = 42
print(heights)


var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "The Penguin"
print(archEnemies)
print("The arch enemy of Batman is: \(archEnemies["Batman", default: "Unknown"])!")


let results = [
    "english": 100,
    "french": 80,
    "geo": 85
    ]
let historyResult = results["history", default: 0]
let geoResult = results["geo", default: 0]
print("Your history grade is: \(historyResult). Are you sure you took this class?")
print("Your Geography grade is: \(geoResult)")


//  count and removeAll() both exists for dictionaries, and work just like they do for arrays.


// Sets
// Use them for fast data look up
// Sets delete duplicates, and dont have an exact order (like an array)
// Sets are opitmized for fast look up of items

let actors = Set([ // no duplucates important with speicifc names
    "Denzel Washington",
    "Tom Cruise",
    "Nick Cage",
    "Sam Jackson"
])
print(actors)

// There is no append(), instead we use insert()
var digits = Set<Int>()
digits.insert(2)
digits.insert(5)
digits.insert(5)
digits.insert(7)
digits.insert(9)
print(digits)


    .contains()
    .sorted() // returns a sorted array of the items



// Enums
// a set of name values we create and use in our code

var selected = "Monday"
selected = "Tuesday"
selected = "Januaary" // Is a month!!
selected = "Friday " // Has a space!

// How do we fix this?
// Define a type that has a specific type of values

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday // Swift knows it is Weekday as its in the var
day = .friday
// day = .january warns it doesnt exist
print(day)

