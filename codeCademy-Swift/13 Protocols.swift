
//***
// Protocols and Generics

// Protocol 
// A protocol defines a blueprint or a set of requirements that are needed to accomplish a 
// particular task. Classes, structs, and enums can conform to protocols by providing an 
// implementation of the protocol’s functions and properties.

protocol WelcomeMessagePrinting { // sets the props and methods the struct must abide to
    var helloMessage: String { get }
    func printHello()
}
struct Hello: WelcomeMessagePrinting { // var helloMessage, and func printHello() (can be moved to an extension) 
        var helloMessage: String {
        return "Welcome"
    }
    
    func printHello() {
        print(helloMessage)
    }
} 
// It is possible to have multiple types confomring to the same protocol
struct NewUserWelcomeView: WelcomeMessagePrinting {
    var helloMessage: String = "Thanks for signing up!"
    func printHello() {
        print(helloMessage)
    }
}
struct ReturningUserWelcomeView: WelcomeMessagePrinting {
    var helloMessage: String = "Welcome back!"
    func printHello() {
        print(helloMessage)
    }
}
let hello = Hello()
hello.printHello() // Prints: Welcome
var view: WelcomeMessagePrinting
view = NewUserWelcomeView()
view.printHello() // Prints: Thanks for signing up!
view = ReturningUserWelcomeView()
view.printHello() // Prints: Welcome back!
//
//
protocol Incrementable {
  var currentValue: Double { get }
  mutating func increment()
}

struct VisitorCounter: Incrementable {
  var currentValue = 0.0
  mutating func increment() {
    currentValue += 1
  }
}
struct Wage: Incrementable {
  var currentValue = 15.0 
  mutating func increment() {
    currentValue += currentValue * 0.10
  }
}
var parkGuests = VisitorCounter()
parkGuests.increment()
print(parkGuests.currentValue)
var salary = Wage()
salary.increment()
print(salary.currentValue)


// Protocol in the Swift Standard Lib
// Hashable -  used to make structs, classes, and enums able to be added to Sets and Dictionaries. 
struct Store: Hashable {
  var name: String
  var products: [String]
}

let jaysPizza = Store(name: "Jay's Pizza", products: ["Pizza", "Soda", "Salad"]) 
let salesByStore: [Store: Double] = [jaysPizza: 100] // added Store/jaysPizza to a dict
print("Hey are you going to \(jaysPizza.name) later? I here that have great \(jaysPizza.products[1])")


// Protocol Inheritance
// Protocols can inherit from another protocol, like a class can inherit from another class. 
// Protocols can even inherit from multiple protocols at the same time!
// A struct, class, or enum that conforms to a protocol must implement all requirements 
// from the protocol as well as any of the protocols that it inherits from.
protocol Viewer {
    func login()
    func logout()
    func showContent()
}
protocol Creator: Viewer {
    func uploadNewContent(name: String)
}
struct VideoContentCreator: Creator {
    func login() {
        print("Successfully logged in")
    }
    func logout() {
        print("Successfully logged out")
    }
    func showContent() {
        print("Here are the new videos")
    }
    func uploadNewContent(name: String) {
        print("Thanks for uploading your new video: \(name)!")
    }
}
//
//
protocol Car: CustomStringConvertible {
    var model: String { get }
    var topSpeed: Double { get }
    var description: String { get }
}
protocol ElectricCar: Car { // conforming to Car
    var range: Double { get }
}
protocol GasCar: Car {
    var milesPerGallon: Double { get }
}
struct Oldsmobile: GasCar {
    let model: String
    let topSpeed: Double
    let milesPerGallon: Double
    var description: String {
        "This is an Oldsmobile \(model) with a top speed of \(topSpeed) that gets \(milesPerGallon) miles per gallon"
    }
    
}
struct Tesla: ElectricCar {
    let model: String
    let range: Double
    let topSpeed: Double
    var description: String {
        "This is a Telsa \(model) with a top speed of \(topSpeed) and a range of \(range)"
    }
}
let modelX = Tesla(model: "Model X", range: 350, topSpeed: 155)
let achieva = Oldsmobile(model: "Achieva", topSpeed: 139, milesPerGallon: 32)
let cars: [Car] = [modelX, achieva]
for car in cars {
    print(car.description)
}


// Protocol Extensions
// Allows us to proviude default implementation of a protocol 
protocol PenSelling {
    var penPrice: Int { get }
    func price(withPenCount count: Int) -> Int
}
extension PenSelling {
    var penPrice: Int {
        return 2
    }
    func price(withPenCount count: Int) -> Int {
        return penPrice * count
    }
}
// automatically has a penPrice of 2 and the above implementation of price(withPenCount:) without writing any code!
struct Bookstore: PenSelling {
    let name: String
}
let miasStore = Bookstore(name: "Mia's Books")
print(miasStore.price(withPenCount: 10)) // prints 20
// Can also provide their own implementations for any or all properties and methods
struct ArtStore: PenSelling {
    let name: String
    var penPrice: Int = 5
}
let noahsStore = ArtStore(name: "Noah's Art Supplies")
print(noahsStore.price(withPenCount: 10)) // prints 50
//
//
protocol IceCreamSelling {
    var flavors: [String] { get }
}
extension IceCreamSelling {
  var flavors: [String] {
    ["Vanilla", "Chocolate"]
  }
}
struct IceCreamTruck: IceCreamSelling {
    let name: String
}
struct IceCreamParlor: IceCreamSelling {
    let name: String
    var flavors: [String] {
      ["Mint Chip", "Strawberry", "Cookie Dough"]
    }
}
let misterSoftee = IceCreamTruck(name: "Mister Softee")
let popTates = IceCreamParlor(name: "Pop Tate's")
print(misterSoftee.flavors)
print(popTates.flavors)


// Generic Functions
// < > 
// <: >
//Instead of writting: 
func max(x: Int, y: Int) -> Int { // or Double
    return x > y ? x : y
}
// Generic Funcs allows us to accept both Ints and Doubles
// shows that T conforms to the Comparable protocol but we don’t know T’s exact type
func max<T: Comparable>(x: T, y: T) -> T {
    return x > y ? x : y
}
let maxInt = max(x: 10, y: 12)
//or
let maxDouble = max(x: 22.87, y: 66.23)
print(maxDouble)

// Also applicable with funcs
func buildSingleEntryDictionary<Key, Value>(withKey key: Key, andValue value: Value) -> [Key: Value] {
    var dict = [Key: Value]()
    dict[key] = value
    return dict
}
let populations = buildSingleEntryDictionary(withKey: "India", andValue: 1.37)
let classes = buildSingleEntryDictionary(withKey: "Ms. Frizzle", andValue: ["Arnold", "Carlos", "Dorothy"])
//
//
func tripleValues<T: Numeric>(in nums: [T]) -> [T] {
    return nums.map { $0 * 3 }
}
let intArr = [1,2,3]
let doubleArr = [1.0, 2.5, 3.9]
print(tripleValues(in: intArr))
print(tripleValues(in: doubleArr))


// Generic Types
// When creating instances of generic types, the instance is locked into the type it used.
// Classes, structs, and enums can also be generic, which means they can work with many different types. 
struct InformationWrapper<T> {
    var information: T
}
var stringWrapper = InformationWrapper(information: "Hello!")
var intWrapper = InformationWrapper(information: 5)
stringWrapper = InformationWrapper(information: 4.0) // ERROR: Cannot convert value of type 'Double' to expected argument type 'String'

// Can specifiy that the type must cornform to one or more protocols
struct HashableInformationWrapper<T: Hashable> {
    var information: T
}
//
//
struct GameResult<Score: Comparable> {
    let playerOne: String
    let playerTwo: String
    let playerOneScore: Score
    let playerTwoScore: Score 
    func printWinner() {
        if playerOneScore > playerTwoScore {
            print("\(playerOne) Wins!")
        } else if playerOneScore < playerTwoScore {
            print("\(playerTwo) Wins!")
        } else {
            print("It's a tie!")
        }
    }
}
let ufcResult = GameResult(playerOne: "Forrest Griffin",
                           playerTwo: "Stephan Bonnar",
                           playerOneScore: 29,
                           playerTwoScore: 28)
ufcResult.printWinner()
let chessResult: GameResult<Double> = GameResult(playerOne: "Boris Spassky",
                           playerTwo: "Bobby Fischer",
                           playerOneScore: 8.5,
                           playerTwoScore: 12.5)
chessResult.printWinner()


// Associated Types
//
// associatedtype T means it is left to the conforming class or struct to specify what that type should be. 
protocol ValuePrinting {
   associatedtype T
   var value: T { get }
   func printValue()
}
//Using a String
struct StringPrinter: ValuePrinting {
    let value: String
    
    func printValue() {
        print("My string value is \(value)")
    }
}
// Using a Double
struct DoublePrinter: ValuePrinting {
    let value: Double
    
    func printValue() {
        print("My double value is \(value)")
    }
}
//
//
protocol SummableCollection {
  associatedtype T: AdditiveArithmetic
  var elements: [T] { get }
  var total: T { get }
}
extension SummableCollection {
  var total: T {
    elements.reduce(T.zero, +)
  }
}
struct IntCollection: SummableCollection {
  var name: String
  var elements: [Int]
}
struct DoubleCollection: SummableCollection {
  var name: String
  var elements: [Double]
}
let revenue = DoubleCollection(name: "Monthly Revenue in Thousands", elements: [1.5, 3.2, 1.8])
let homeRuns = IntCollection(name: "Home Runs", elements: [1, 0, 2])
print(revenue.total)
print(homeRuns.total)


// Opaque Types
// allow us to hide the specific data type that is being returned from the caller. 
// The caller doesn’t need to know the exact type being returned in this case, 
// only that the function should return something that conforms to whichever
// if we use an opaque type, all of the underlying types have to be the same.
func getHashbleThing() -> some Hashable {
    return Bool.random() ? "hello" : "goodbye"
}



// REVIEW
// Define and conform to custom protocols
// Conform to protocols in the Swift standard library
// Use protocol inheritance
// Provide default protocol implementation using protocol extensions
// Define generic functions
// Define generic types
// Define generic protocols with associated types
// Write functions that return opaque types