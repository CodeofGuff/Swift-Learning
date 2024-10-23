
//***
// Functions
// Chunks of reusable code to achieve a certian outcome
// A function definition consists of a function’s name, optional input values, and the type of value the function returns. 
func functionName() -> returnType { //return arrow (->) with the type of data the function gives back, or returns
} 
func functionName() { // where the -> and type are omitted entirely.
}
func functionName() -> Void { // where Void is listed as the type.
}
func greeting() -> Void {
  print("Hey there!")
  print("How are you doing today?")
} 
greeting()


// Returning a Value
let birthYear = 1990
var currentYear = 2024
//
func findAge() -> Int {
  return currentYear - birthYear
}
var age = findAge()
print(age)
//
let weight = 70.0 // in Kilograms
let height = 1.73 // in Meters
func findBMI() -> Double {
  return weight / (height*height)
}
print(findBMI())


// Parameters and Arguments 
// Optional input values that exist between the () in a functin defintion 
// Allows a function to directly accept the input it need to execute a task
// Defined as:
func someFunction(paramName: paramType) -> returnType {
   // function body where paramName can be used
}
//
func findSquareOfBox(side: Int) -> Int {
  return side * side
} 
// Accepts a single parameter, side, of the type, Int, and returns a value of the Int type. 
// Within the function, the result of multiplying side by side is returned.
 var area = findSquareOfBox(side: 4)
print(area) // 20 
//
func findCircumference(diameter: Double) -> Double {
  return 3.14 * diameter
}
var result = findCircumference(diameter: 3)
print(result)


// Multiple Parameters
// 
// Determines if a racer qualifies
func didQualify(slowestDriver: Bool, retired: Bool) -> String { 
  if slowestDriver || retired {
    return "Eliminated"
  }
  else {
    return "Qualified"
  }
}
print(didQualify(slowestDriver: true, retired: true)) // both must = false
//
func timeToDestination(distance: Int, speed: Int) -> Int {
  let time = distance / speed
  return time
}
print(timeToDestination(distance: 6836, speed: 560))


// Argument Labels
// 
func setOvenTempurature(tempurature: Int) {
  print("The oven is now set to \(tempurature) degrees.")
}
print(setOvenTempurature(tempurature: 400))
// ReWritten with argument labels
func setOvenTempurature(to tempurate: Int) {  // place a word before the Agument to reference it later. 
    print("The oven is now set to \(tempurature) degrees.")
}
print(setOvenTempurature(to: 400))
//

var friendList: [String] = [String]()
func addFriend(name friendName: String) {
  friendList.append(friendName)
}
addFriend(name: "David")
addFriend(name: "Marissa")
addFriend(name: "Maple")
addFriend(name: "Ruth")
print(friendList)


// Omitting Argument Labels with an _ underscore
// Helps with cleaner code and less repetition
// When an _ is specified ahead of a parameter name in the definition, 
// only the argument value needs to be specified in the function call:
let firstTeamScore = 5
let secondTeamScore = 7
func findWinner(_ firstPoints: Int, secondPoints: Int) -> String {
  if firstPoints > secondPoints {
    return "Team 1 wins!"
  }
  else {
    return "Team 2 wins!"
  }
}
let result = findWinner(firstTeamScore, secondPoints: secondTeamScore)
print(result)

let adults = 2
let students = 15 
func museumEntry(_ numAdults: Int, _ numStudents: Int) -> Int {
  let studentTicket = 14
  let adultTicket = 25
  let total = (studentTicket * numStudents) + (adultTicket * numAdults)
  return total
}
let totalCost = museumEntry(adults, students)
print("The total cost of this trip is \(totalCost)$")


// Returning Multiple Values
// We can wrap the Return in a collection, such as an array or tuple. 
// The collection as a whole is considered a single value, so it can be returned from a func. 
func favoriteBook() -> (name: String, author: String, yearPublished: Int) {
  return ("Harry Potter and the Philosopher's Stone", "J.K. Rowling", 1997)
}
let book = favoriteBook()
print(book) // tuple putput
print(book.name) // use dot syntax to interact with the tuple
print(book.author)

func favoriteCuisine() -> (name: String, dish: String) {
  return ("pizza", "Hawaiian")
}
let cuisine = favoriteCuisine()
print("My fave \(cuisine.name) dish is \(cuisine.dish)")


// Implicit Return 
// Aids in shortening the code within a func. Exisits in other langs. 
// When theres only 1 expression or value in the body, we can omit 'return'
// These are optional and only there for asthetic/short code
// Single Expression
func findProduct(a: Int, b: Int) -> Int {
 a * b // return removed
}
print(findProduct(a: 4, b: 7))

func findRemainder(dividend: Int, divisor: Int) -> Int {
  dividend % divisor //return removed
}
print(findRemainder(dividend: 10, divisor: 4))


// Default Parameters
// Assign a real value to a paramter, does not require an argument when the function is called
func totalWithTip(total: Double, tip: Double = 0.2) -> Double {
  total + (total * tip) // using Implicit return
}
let total = totalWithTip(total: 50)
print(total)

func bookingTicket(passengerName: String = "David", seatClass: String = "Economy", timeOfDeparture: Int) -> String {
  "\(passengerName), your seat class is \(seatClass), and you will be departing at \(timeOfDeparture)" // using Implicit return
}
print(bookingTicket(timeOfDeparture: 9))
print(bookingTicket(seatClass: "Business", timeOfDeparture: 9))

// Variadic Parameters
// Accepts zero or more values of a certain type
// When you need to pass more then one value for a single parameter
// a func can only have one Variadic Param at a time
// funcName(name: Type...) , name type and 3 dots. Interpretted as an Array of a specific type
func avgExchangeRate(numbers: Double...) -> Double { // varidiac param that accepts 0 or more values of a Double type. Interpreted as an array
  var total: Double = 0
  let numValues = Double(numbers.count)
  for number in numbers { // iterates over each number in numbers and 
    total += number  // adds the values of number to the total each time
  }
  return total / numValues // calculates the average by dividing the total by the number of items (numValues) in numbers
}
print(avgExchangeRate(numbers: 0.79, 0.82, 0.80, 0.79, 0.78))

func avgSongLength(times: Int...) -> Int {
  var total = 0
  for time in times {
    total += time
  }
  return total / times.count // counts 
}
print(avgSongLength(times: 183, 176, 180, 176, 184, 179, 181, 180, 172, 178))


// In-Out Parameters
// Allows a function to reassign the value of a variable passed in as an argument
// Declared in the function definition after the parameter name and before its specified type
// func funcName(parameterName: inout parameterType) -> returnType {}
var currentColor = "green"
func batteryInt(percentage: Int, batteryColor: inout String) {
  if percentage < 5 {
    batteryColor = "red"
  }
  else if percentage < 20 {
    batteryColor = "yellow"
  }
  else {
    batteryColor = "green"
  }
}
batteryInt(percentage: 12, batteryColor: &currentColor) 
// an ampersand & must be used directly before the variable name that will act as the argument
// instructs the program that that var can be modified
print(currentColor)

var currentGeneratorState = "Off"
func generators(powerOutage: Bool, state: inout String) {
  if powerOutage == true {
    state = "On"
  }
  else {
    state = "Off"
  }
}
generators(powerOutage: true, state: &currentGeneratorState)
print(currentGeneratorState)


// REVIEW
// A function definition consists of a function name followed by optional parameters and a return type.
// The function body holds the function’s task.
// A function will execute only when it is called.
// A return keyword is used to return a value from a function.
// A function’s return type is specified in the function definition followed by an ->. If a function does not return any values, it’s return type is Void or the arrow and type are omitted entirely.
// A return statement can be omitted if the function consists of only one expression to return. This is called an implicit return.
// A parameter is a placeholder for a real value passed into a function. A parameter must be enclosed within () of a function definition and must have a specific type.
// An argument is a real value passed in for a parameter in the function call.
// A function can accept multiple parameters separated by commas. As many parameters as a function accepts, as many arguments or real values must be passed into the function when it is called.
// A function can return multiple values in the form of a tuple.
// Swift offers support for wide variety of parameter use cases within a function:
// Default Parameter: a parameter that sets a value to the parameter that will be used if an argument is omitted.
// Variadic Parameter: a parameter that accepts zero or more values of the parameter’s type.
// In-out Parameter: a parameter whose value is passed into a function and modified within the body.


// Rock Paper Scissors

func getUserChoice(userInput: String) -> String { // This func Determines what the user is inputing 
  if userInput == "rock" || userInput == "paper" || userInput == "scissors" {
    return userInput
  }
  else {
    return "You can only enter rock, paper, or scissors. Try again."
  }
}

func getComputerChoice() -> String { // The func determines what the computer picks!!!
  let randomNumber: Int = Int.random(in: 0...2)
  switch randomNumber {
    case 0:
      return "rock"
    case 1:
      return "paper"
    case 2:
      return "scissors"
    default:
      return "Something went wrong"
  }
}

func determineWinner(_ userChoice: String, _ compChoice: String) -> String { // This func allows us to select a winner based on the previous funcs picks
  var decision = "It's a tie"
  switch userChoice {
    case "rock":
      if compChoice == "paper" {
        decision = "The computer won"
      }
      else if compChoice == "scissors" {
        decision = "The user won"
      }
    case "paper":
      if compChoice == "rock" {
        decision = "The user won"
      }
      else if compChoice == "scissors" {
        decision = "The computer won"
      }
    case "scissors":
      if compChoice == "rock" {
        decision = "The computer won"
      }
      else if compChoice == "paper" {
        decision = "The user won"
      }
    default:
      return "Something went wrong"
  }
  return decision
}

let userChoice = getUserChoice(userInput: "paper") // These conts allow us to pass the previous funcs as arguments to determine a winner
let compChoice = getComputerChoice()
print("You threw \(userChoice)")
print("The computer threw \(compChoice)")
print(determineWinner(userChoice, compChoice))

