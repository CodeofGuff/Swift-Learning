
//***
// Learning Swift Conditionals 

// Comparision Operators 
// == Equal to
// != Not Equal to
// > Greater than
// < Less than
// >= Greater than or equal to
// <= Less than or equal to

// if statements run when the code is true
// else if for when the first condition isn't made
// else when the code is flase


var coinBag: Int = 15
if coinBag >= 20 {
    print("You have \(coinBag) coins, mighty rich!")
}
else if coinBag >= 15 {
    print("You have \(coinBag) coins, needs some work!")
}
else if coinBag >= 5 {                                
    print("You have \(coinBag) coins, you're poor")
}
else {
    print("You have \(coinBag) coins, so no money.")
}

var abbreviation: String = "ES"
if abbreviation == "ES"{
  print("Spanish")
}
else if abbreviation == "ZH"{
  print("Chinese")
}
else if abbreviation == "RU"{
  print("Russian")
}
else if abbreviation == "EN"{
  print("English")
}
else {
  print("Abbreviation not found")
}


// Ternary Condition 
// A ? B : C
// A is the condition to check for ? B is the expression to use if the condition is true : C is the expression to use if the condition is false
var windy: Bool = true
windy ? print("ITS BLOWIN!!!") : print("It is not windy!")

// is the same as 

if windy {
    print("ITS BLOWIN!!!")
}
else {
    print("It is not windy!")
}


// Switch Statements
// Used to check the value of a given expression against multiple cases. 
// Does not check for the value of a condition (like an if statement) and instead finds and matches a case to a given expression.
// Can match VALUES to an EXPRESSION that exists within intervals. 
// - An interval denotes a range used for checking whether a given value lies within that range 
//  Range is indicated by 3 dots ( ... )
// Cases can be compound meaning multiple values in a single case
var secretIdentity: String = "Natasha Romanoff"
var superheroName: String 

// Normal if statement
if secretIdentity == "Tony Stark" {
  superheroName = "Iron Man"
} else if secretIdentity == "Natasha Romanoff" {
  superheroName = "Black Widow" 
} else if secretIdentity == "Prince T'Challa" {
  superheroName = "Black Panther"
} else if secretIdentity == "Thor" {
  superheroName = "Thor"
} else {
  superheroName = "Unknown"
}
 // Switch Statement example
switch secretIdentity {
    case "Tony Stark": // the colon : sperates the value to match from the code to be executed
        superheroName = "Iron Man"
    case "Natasha Romanoff":
        superheroName = "Black Widow" 
    case "Prince T'Challa":
        superheroName = "Black Panther"
    case "Thor":
        superheroName = "Thor"
    default:
        superheroName = "Unknown"
}
print(superheroName)


// Interval Matching
// An interval denotes a range used for checking whether a given value lies within that range.
var year: Int = 1943
switch year {
  case 1701...1800:
    print("18th century") 
  case 1801...1900:
    print("19th century")
  case 1901...2000: 
    print("20th century")
  case 2001...2100: 
    print("21st century")
  default: 
    print("You're a time traveler!")
}

var episode: Int = 8
var villain: String 
switch episode {
  case 1...3:
    villain = "Emperor Palpatine"
  case 4...6:
    villain = "Darth Vader"
  case 7...9:
    villain = "Kylo Ren"
  default:
    villain = ""
}
print(villain)
// or
switch episode {
  case 1...3: villain = "Emperor Palpatine"
  case 4...6: villain = "Darth Vader"
  case 7...9: villain = "Kylo Ren"
  default: villain = ""
}


// Compound Cases
var country: String = "India"
switch country {
  case "USA", "Mexico", "Canada":
    print("\(country) is in North America. 🌏")
  case "South Africa", "Nigeria", "Kenya":
    print("\(country) is in Africa. 🌍")
  case "Bangladesh", "China", "India":
    print("\(country) is in Asia. 🌏")
  default: 
    print("This country is somewhere in the world!")
} 

var planet: String = "Earth"
switch planet {
  case "Earth", "Mercury", "Venus", "Mars":
    print("Terrestrial planet")
  case "Saturn", "Jupiter", "Uranus", "Neptune":
    print("Jovian planet")
  default:
    print("Unknown planet")
}


// where Clause
var randomNumber: Int = Int.random(in: 0...10) // Generating and assiging a random Int(integer) using the .random() method to var randomNumber
switch randomNumber {
  case let x where x % 2 == 0: // variable declaration, followed by a where clause and condition. When true, the code executes. 
    print("\(randomNumber) is even") // where condition checks if x can be divided by 2 
  case let x where x % 2 == 1: // let followed by x creates a temp binding to the randomNumber value. So x becomes randomNumbers value (temporariliy)
    print("\(randomNumber) is odd") // used let instead of var because x is never reassigned, and value is constant. 
  default:
    print("Invalid")
}

var wholeNumber = Int.random(in: 10...20)
print(wholeNumber)
switch wholeNumber {
  case let x where x % 2 == 0:
    print("Composite")
  case let x where x % 3 == 0:
    print("Composite")
  default:
    print("Prime")
}

let number = 24
switch number {
  case let x where x % 5 == 0:
    print("This number is a multiple of 5")
  case let x where x % 6 == 0:
    print("This number is a multiple of 2, 3 and 6")
  case let x where x % 7 == 0:
    print("This number is a multiple of 7")
  default:
    print("Not sure about this one")
}

// Review
// An if statement consists of a condition and code block that executes when the condition is true
// An else statement is immediately followed by a code block that executes when all previous conditions were false
// A code block is denoted by a set of curly braces {}
// Multiple else if statements can be chained within an if/else to provide additional condition
// Comparison operators include <, >, <=, >=, ==, and != and are used to compare the values of two operands
// A switch statement looks for the value of a case that matches the value of an expression
// A switch statement can have cases that contain multiple items known as compound cases
// A switch statement’s case can include a range of values using the closed range operator (...)