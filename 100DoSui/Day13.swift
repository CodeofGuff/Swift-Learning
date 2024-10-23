//Day13



// Protocol and Extensions

// Create and use protocols
// Protocols act like contracts, they let us define what kinds of functionality we epect  data type to support
// Define a series of properties and methods, with no actual code behind it.
// method bodies do not have any function bodies, we are just specifiying the names, params, and return types, (mutating, throwing etc)
protocol Vehicle {
    var seats: Int { get } // readable
    var passengers: Int { get set } // readable / writable
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
// With this protocol we can design types to work with it.
// Adopting or Conforming to the Protocol.. any struct, enum or class that conforms to the protocol must call those funcs/props

protocol CanBeElectric {
}
struct Car: Vehicle, CanBeElectric { // conforming or adopting Vehicle, similar to SubClasses
    let seats = 4
    var passengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I am driving \(distance) miles")
    }
    func openSunRoof() {
        print("It is a nice day!")
    }
}

struct Bicycle: Vehicle {
    let seats = 2
    var passengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I am cycling \(distance) miles")
    }
}

func commute(distance: Int, using vehicle: Vehicle) { // Vehicle can be used instead of Car, allowing any param to be placed with the Vehicle protocol
    if vehicle.estimateTime(for: distance) > 100 {
        print("To SLOW!!")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.seats) seats are available for the \(distance) mile trip, which will take \(vehicle.estimateTime(for: distance)) hours!")
    }
}

let car = Car()
commute(distance: 100, using: car)
    
let bike = Bicycle()
commute(distance: 101, using: bike)
getTravelEstimates(using: [car, bike], distance: 50)



// Opaque Return Types
// some Equatable instead of Int, Bool, String, Double
// Letting swift know we are returning a bunch of things but I want swift to interpret it and figure it out, like in a View
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...3)
}
func getRandomBool() -> some Equatable {
    Bool.random()
}
print(getRandomNumber() == getRandomNumber() ? print("Yay!") : print("Boo!"))

let i = getRandomNumber()
if i == 2 { // doesnt work with some Equatable != Int
    print("yay! a 2")
} else {
    print("Boo not a 2!")
}



// Create and use extensions
// let us add functionality to any type
// Extenions benefits
// Code completetiin
// Code Organization
// Internal Access - extentins get access to all the internal properpeties and methods
// Extenions can add computed properties (no other type of properties)
// Extensions let us add functionality to classes, structs, and more,
// which is helpful for modifying types we don’t own – types that were written by Apple or someone else, for example.

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines) // self. refers to the current string instance
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "   The truth is ...   "
let trimmed = quote.trimmed() // let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
quote.trim()
let lyrics = """
Da nun un nunu
Da nanan nunu
ddanuununun nu
nunu
LETS GO
"""
print(lyrics.lines.count)


// sometimes you want both your own init and swifts init
// use an extension!
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
// Now with the init in the Extension I can either put readingHours manually or let the the init use the reading hours default
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 300) // I can take out readingHours, or place in my own param

print(lotr)

// Computed Property IE
extension Double {
	var isNegative: Bool {
		return self < 0
	}
}


// Create and use Protocol Extensions
// Protocols let us define contracts that conforming types must adhere to,
// and extensions let us add functionality to existing types.
// But what would happen if we could write extensions on protocols
// Collection

// now we just write .isNotEmpty to check the list
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {  // if !guests.isEmpty {} or if guests.isEmpty == false {}
    print("Guest count: \(guests.count)")
}


protocol Person {
    var name: String { get }
    func sayHello()
}
// providing a default implementation inside the protocol extension
extension Person {
    func sayHello() {
        print("Hi, I am \(name)")
    }
}

struct Employee: Person {
    let name: String
    // no need to add func sayHello() as we provided the default in the ext
}

let david = Employee(name: "David Guffre")
david.sayHello()


// Checking an array of numbers are even using allSatisfy
let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }
// It also work son Sets!
let numbers2 = Set([4, 8, 15, 16])
let allEven2 = numbers2.allSatisfy { $0.isMultiple(of: 2) }
// and dicts!
let numbers3 = ["four": 4, "eight": 8, "fifteen": 15, "sixteen": 16]
let allEven3 = numbers3.allSatisfy { $0.value.isMultiple(of: 2) }
//Of course, the Swift developers don’t want to write this same code again and again,
//  so they used a protocol extension: they wrote a single allSatisfy() method that works on a protocol 
// called Sequence, which all arrays, sets, and dictionaries conform to. 
// This meant the allSatisfy() method immediately became available on all those types, sharing exactly the same code.

protocol Anime {
	var availableLanguages: [String] { get set }
	func watch(in language: String)
}
extension Anime {
	func watch(in language: String) {
		if availableLanguages.contains(language) {
			print("Now playing in \(language)")
		} else {
			print("Unrecognized language.")
		}
	}
}


//REVIEW
// Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
// Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
// Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
// Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.


// How to get the most from Protocol Extentions
extension Numeric {
    func squared() -> Self { // Self is refering to whatever the data Type we are currently calling, in this case an Int
        self * self // self = the curent Value, in this case 5
    }
}
let wholeNumber = 5
print(wholeNumber.squared())

// Equatable, which is what Swift uses to compare two objects using == and !=
// Comparable, which allows Swift to see if one object should be sorted before another.
// we can remove Equatable and the code for == != would still work as Comparable inherits Equatable already
struct User: Equatable, Comparable {
    let name: String
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2)
print(user1 != user2)
print(user1 < user2) // true, Link comes before Zelda
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)
