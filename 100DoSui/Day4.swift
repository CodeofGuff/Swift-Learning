//Day 4




// Type annotations
// Allows explicicty in swift
let surname = "Lasso"  // swift infers surname is a String as "Lasso" is in it
var score = 0

//Type annotation looks like
let surname2: String = "Lasso"
var score2: Double = 0

let Playername: String = "Roy"
let luckyNumber: Int = 12
let isTrue: Bool = true
let albums: [String] = ["Red", "Fearless"]
let user: [String: String] = ["id": "guff"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])


// Use Type annots to make empty things
var soda: [String] = [String]()
var soda2 = [String]()
var soda3: [String] = [] // inference and my fave


enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
// type is now defined!! we dont need to deinfe it later in the socde
//
style = .dark


// Prefer to use type inferance
// Define a type at creation like:
var definedString = "String"
var definedInt = 0
var definedDouble = 0.0
var definedBool = true
var definedArray = ["Default"]
var definedDict = ["Default: Dict"]
var definedSetString = Set(["String"])
print(type(of: definedSetString))




// This time the challenge is to create an array of strings, 
// then write some code that prints the number of items in the array and also the number of unique items in the array.


let itemBag: [String] = ["Rope", "CoinBag", "Axe", "Ladel", "Rope"]
let dupeChecker: Set<[String]> = Set([itemBag])
print("You have \(itemBag.count) items in your bad and \(dupeChecker.count) of them are duplicates")

print(dupeChecker)