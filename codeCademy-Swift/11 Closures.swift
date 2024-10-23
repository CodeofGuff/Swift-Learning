

//***
// Closures
// self-contained chunks of code that are first-class citizens in Swift.
// Meaning that can be assigned to variables and passed as arguments(params) to functions

//Func
// func functionName(parameters) -> ReturnType {
  // function tasks go here
// }
//Closure
// { (parameters) -> returnType in
  // closure tasks go here
// }
//IE
let myClosure = {
  print("This is my closure")
}


let helloClosures = { print("Hello closures!") }
helloClosures()

// If we take the formula for Feet to Meters 
// LengthInFeet = LengthInMeters * 3.281
let metersToFeet = { (meters: Double) -> Double in
  return meters * 3.281
}
// With Type inferance, it looks like this 
let metersToFeet = { meters in meters * 3.281 }
print(metersToFeet(324))

// takea a String input, and returns Void. 
// Name the param turtle, and switch turtle to print its ability
let turtleAbility: (String) -> Void = { turtle in  
  switch turtle {
  case "Leonardo":
    print("Jujitsu")
  case "Raphael":
    print("Super strength")  
  case "Donatello":
    print("Intelligence") 
  case "Michelangelo":
    print("Eating pizza")  
  default:
    print("Unknown TNMT")
  }
}
//Defining a second closure of the same type and passing it to the description func, to get different functionality
let turtleColor: (String) -> Void = { turtle in  
  switch turtle {
  case "Leonardo":
    print("Blue")  
  case "Raphael":
    print("Red")  
  case "Donatello":
    print("Purple")  
  case "Michelangelo":
    print("Orange")  
  default:
    print("Unknown TNMT")
  }
}

//function that takes a String and closure as a param
//String input named turtle, closure named descriptionClosure(which makes the type of turtleAbility(Void))
func description(for turtle: String, descriptionClosure: (String) -> Void) {
  descriptionClosure(turtle)
}

description(for: "Donatello", descriptionClosure: turtleColor)

// For this exercise we will create a game that calculates the sum of a hand of cards. 
// We will make the game configurable such that it accepts a closure defining the rules for how cards are counted.

let cards = [8,2,5,3,4]
func handValue(cards: [Int], scoringRules: (Int) -> Int) -> Int {
    var totalValue = 0
    for card in cards {
        totalValue += scoringRules(card)
    }
    return totalValue
}

let allCards = { (card: Int) -> Int in
    return card
}
print(handValue(cards: cards, scoringRules: allCards))

let onlyEvens = { (card: Int) -> Int in
    if card.isMultiple(of: 2) {
        return card
    } else {
        return 0
    }
}
print(handValue(cards: cards, scoringRules: onlyEvens))


// We can define closures as we call functions without hacing to assign it to a variable
// Trailing closures:
//Accepts closure as an argument
func networkRequest(endAction: () -> Void) {
  // Get data from online
   completion()
}
// Defining the closure inline when we call the function
networkRequest(endAction: { print("Data loaded!") })

//Multiple Trailing Closures
func networkRequest(startAction: () -> Void, endAction: () -> Void) {
   startAction()
  // function execution
   endAction()
}
// Called like:
networkRequest {
  print("Starting to Load!")
} endAction: {
  print("Data loaded!")
}



// Syntactic Sugar
// Closures are very common in Swift and there are ways to shorten the code
// Type inference: Swift is a strongly typed language meaning it can infer the types based on the function definition. 
//   We don’t need to be explicit with the parameter types and return types.
// Implicit returns: If a closure has a single expression, the return keyword can be omitted. Swift can infer the return type based on the function definition
// Shorthand argument names: argument names can be omitted in favor of $0, $1, and so on, corresponding to each argument in the closure
// Operators: Swift’s Int type has an Int-specific definition of the + operation that matches the type of the closure. T

func performOperation(on valueOne: Int, and valueTwo: Int, using operation: (Int, Int) -> Int) -> Int {
    operation(valueOne, valueTwo)
}
// Turn the function call:
performOperation(on: 1, and: 3, using: { (valueOne: Int, valueTwo: Int) -> Int in
  return valueOne + valueTwo
})
// Into this: 
performOperation(on: 1, and: 3) { $0 + $1 }
// Since that are both Int, you can even shorten using the operator +: 
performOperation(on: 1, and: 3, using: +)


// Built in Higher Order Functions
// Most common are: Filter, Sort, Map, Reduce
var grades = [85, 76, 59, 47, 91, 88, 99, 64, 77, 50, 60, 80]
let passingGrades = grades.filter { (grade) -> Bool in return grade >= 60 }
// With Syntactic SUgar: 
let passingGrades2 = grades.filter { $0 >= 60 }
print(grades.sorted(by: <)) // lowest to highest

var names = ["Jason", "Kimberly", "Zach", "Austin", "Sarah", "Adam", "Kathy"]
let aNames = names.filter { $0.hasPrefix("A") }
print(aNames)
let sortedNames = names.sorted(by: <)
print(sortedNames)


//Escaping Closures
// A closure can be called after the function it was passed into returns. 
// This is called an escaping closure and is wrapped with the @escaping keyword
//  Closures also escape when they are assigned to a variable to be used later on.
struct Recipe {
  let ingredientAdder: (String) -> Void // a reference to the closure in the init
  
  init(ingredientAdder: @escaping (String) -> Void) {  // telling the compiler to hold a reference to the closure for later use
    self.ingredientAdder = ingredientAdder
  }
}


// Capturing Values
// With closures we can capture variables and constants outside the scope of the closure. 
// This is known as “closing over” the values that are captured. 
// One example is a nested function.
func makeFriendAdder() -> (String) -> [String] {
  var friends = [String]()
  let addFriend: (String) -> [String] = { name in
    friends.append(name)
    return friends
  }
  return addFriend
}
// With Type Inferance: 
func makeFriendAdder() -> (String) -> [String] {
  var friends = [String]()
  return { name in
    friends.append(name)
    return friends
  }
}

let friendAdder = makeFriendAdder()
friendAdder("Jake")
print(friendAdder("Kate"))

func createMultiplier(factor: Int) -> () -> Int {
  var value = 1
  let multiplier: () -> Int = {
    value *= factor
    return value
  }
  return multiplier
}
let multiplier = createMultiplier(factor: 3)
print(multiplier())
print(multiplier())
print(multiplier())




// REVIEW
// Define closures
// Pass closures to functions
// Use trailing closure syntax and closure syntax sugar
// Call built-in higher-order functions like filter
// Mark closures as @escaping so they can be stored for later
// Capture values inside a closure

// Calulator
struct Calculator {
func reduce(_ nums: [Int], using nextPartialResult: (Int, Int) -> Int, startingAt initialResult: Int) -> Int {
var total = initialResult
        for num in nums {
            total = nextPartialResult(total, num)
}
return total
}
func filter(_ nums: [Int], using isIncluded: (Int) -> Bool) -> [Int] {
var filteredNums = [Int]()
        for num in nums {
            if isIncluded(num) {
                filteredNums.append(num)
}
}
return filteredNums
}
func map(_ nums: [Int], using transform: (Int) -> Int) -> [Int] {
var mappedNums = [Int]()
        for num in nums {
            mappedNums.append(transform(num))
}
return mappedNums
}
func sort(_ nums: [Int], by areInIncreasingOrder: (Int, Int) -> Bool) -> [Int] {
var nums = nums
        for indexOne in 1..<nums.count {
var indexTwo = indexOne
            while indexTwo > 0 && areInIncreasingOrder(nums[indexTwo], nums[indexTwo - 1]) {
                nums.swapAt(indexTwo - 1, indexTwo)
                indexTwo -= 1
}
}
return nums
}
}
let calculator = Calculator()
let tips = [6,4,8,3,5,2]
let addition: (Int, Int) -> Int = { $0 + $1 }
let sum = calculator.reduce(tips, using: addition, startingAt: 0)
print(sum)
let rainfallInInches = [5,2,8,0,0,4]
let rainyDays = calculator.filter(rainfallInInches, using: { rainFall in rainFall != 0 })
print(rainyDays)
let roomPrices = [50,100,150,200,250,500]
let roomPricesWithSurchase = calculator.map(roomPrices) { $0 + 20 }
print(roomPricesWithSurchase)
let calories = [400, 800, 500, 1_000]
let sortedCalories = calculator.sort(calories, by: <)
print(sortedCalories)