//Day14

//Optionals
//Fuck yeah


// an optional is trying to answer the question “what if our variable doesn’t have any sort of value at all?”
// Data that might, or might not be present Type?
// Any kind of Data can be optional
// an empty value, and a nil value are DIFFERENT
// otionals that are nil dont exist,
// values that are empty exist, but are emtpy
var num1 = 0
var num2: Int? = nil
var str1 = ""
var str2: String? = nil


let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"] // reads nil
// unwrap an optional with an if let, taking the value out of the box
// if let combines a condition if, with const, let
if let marioOpposite = opposites["Mario"] { // reads a value from the dict, if the there is a value.. it is placed into marioOpposite
    print("Marios opposite is \(marioOpposite)") // so the condition is run
}


var username: String? = nil
if let unwrappedName = username {
    print("\(unwrappedName)")
} else {
    print("Empty")
}


func square(number: Int) -> Int {
    number * number
}
let number: Int? = nil
// unwraps the code, it wont run, but it is unwrapped
if let number = number { // creating a new const, number that only works inside the if let {}
    print(square(number: number))
}

//ie
let song: String? = "Shake it Off"
if let unwrappedSong = song {
	print("The name has \(unwrappedSong.count) letters.")
}

let album = "Red"
let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: album) {
	print("Found \(album) at position \(position).")
}


// Unwrap Optionals with Guard
// checks whether there is or is not a value, like an if let, however
// use guard let to ENSURE an optional has something inside of it.
// guard let is designed to exit the current function, loop, or condition if the check fails,
//  so any values you unwrap using it will stay around after the check.
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

var myVar: Int? = 3
if let unwrapped = myVar {
    // Run if myVar has a value inside
}
guard let unwrapped = myVar else {
    // Run if myVar doesn't have a value inside, hence the else statement as well
    // Swift requires the use of return or exiting the func if the check fails
    // Guard allows the unwrapped variable to remain in use
    return
}

//ie
func double(number: Int?) -> Int? {
	guard let number = number else {
		return nil
	}
	return number * 2
}
let input = 5
if let doubled = double(number: input) {
	print("\(input) doubled is \(doubled).")
}

//uppercase
func uppercase(string: String?) -> String? {
	guard let string = string else {
		return nil
	}
	return string.uppercased()
}
if let result = uppercase(string: "Hello") {
	print(result)
}



// Unwrap Optionals with Nil Coalescing ??
// it lets us unwrap an optional and provide a default value if the optional was empty.

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Ted Lasso", "South Park"]
let fave = tvShows.randomElement() ?? "None"
print(fave)

struct Book {
    let title: String
    let author: String?
}
let book = Book(title: "RedWall", author: nil)
let author = book.author ?? "Anon"
print(author)

let input = ""
let number = Int(input) ?? 0
print(number)

//For example, if you were working on a chat app and wanted to load whatever 
// message draft the user had saved, you might write code like this:
let savedData = loadSavedMessage() ?? ""
// So, if loadSavedMessage() returns an optional with a string inside, 
// it will be unwrapped and placed into savedData. 
// But if the optional is nil then Swift will set savedData to be an empty string. 
// Either way, savedData will end up being a String and not a String?.

// Remember, reading a dictionary key will always return an optional, 
// so you might want to use nil coalescing here to ensure you get back a non-optional:
let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0



// Handle multiple optionals using Optional chaining
// Lets us dig throuh several layers of optionals in a single line of code

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one" // ?.uppercased() = "if the optional has a vlaue, run the code on this value"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}
var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let names = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names["Vincent"]?.first?.uppercased() ?? "?"
print(surnameLetter)

func albumReleased(in year: Int) -> String? {
	switch year {
	case 2006: return "Taylor Swift"
	case 2008: return "Fearless"
	case 2010: return "Speak Now"
	case 2012: return "Red"
	case 2014: return "1989"
	case 2017: return "Reputation"
	default: return nil
	}
}
let album = albumReleased(in: 2006)?.uppercased() ?? "A"
print(album)


// Handling Function Failure with Optionals
// try?
// We can run throwing functions using do, try, and catch in Swift, but an alternative is to use try? 
// to convert a throwing function call into an optional. If the function succeeds, 
// its return value will be an optional containing whatever you would normally have received back, 
// and if it fails the return value will be an optional set to nil.


// In combination with guard let to exit the current function if the try? call returns nil.
// In combination with nil coalescing to attempt something or provide a default value on failure.
// When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to
// a log file or sending analytics to a server, for example.
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anon"
print(user)


// REVIEW
//Optionals let us represent the absence of data, which means we’re able to say “this integer has no value” – that’s different from a fixed number such as 0.
// As a result, everything that isn’t optional definitely has a value inside, even if that’s just an empty string.
// Unwrapping an optional is the process of looking inside a box to see what it contains: if there’s a value inside it’s sent back for use, otherwise there will be nil inside.
// We can use if let to run some code if the optional has a value, or guard let to run some code if the optional doesn’t have a value – but with guard we must always exit the function afterwards.
// The nil coalescing operator, ??, unwraps and returns an optional’s value, or uses a default value instead.
// Optional chaining lets us read an optional inside another optional with a convenient syntax.
// If a function might throw errors, you can convert it into an optional using try? – you’ll either get back the function’s return value, or nil if an error is thrown.
