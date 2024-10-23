//Day 11




// Structs Part 2

//
// How to limit access to internal data using Access Control

// private Dont let anything outside the struct use this
// fileprivate Dont let anything outside the current file use this
// public Let anyone anywhere use this
// private(set) let anyone read it, but only my internal methods can write to it

// If you use private access control for one or more properties,
// chances are you’ll need to create your own initializer.

// Access Control using private
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)
if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// Using an init
struct Toy {
    var customerPrice: Int
    private var actualPrice: Int
    init(price: Int) {
        actualPrice = price
        customerPrice = actualPrice * 2
    }
}
let buzz = Toy(price: 10)
print(buzz)


// Static Properties and Methods
// Creating example Data, and to store constant data that needs to be accessed in various places

// the properties and methods with static belong to the School struct itself,
// rather then induvidual instances of the struct
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

// this following code does not create an instance, [ let school = School.add() ]
// use add() and .studentCount directly on the struct because they are static
// and dont exist uniquely on instances of the struct
// we don't need to mark as mutating as we are accesing the struct directly
School.add(student: "Taylor Swift")
print(School.studentCount)

// self. The current value of a struct, ie  55, "Hello", true
// Self. the current type of struct,    ie  Int, String, Bool

// Using static props to organize common data
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.davidguffrevo.com"
}

AppData.version // can call this wherever in your code to see without creating an instance
print(AppData.version)


// using static props as an 'example'
struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "HeyArnold", password: "1234")
}
Employee.example // this example of what an employee looks like
print(Employee.example)


// I want to store some common information, such as the URL to the app on the App Store, 
// so I can reference that anywhere the app needs it. So, I have code like this storing my data:
enum Unwrap {
    static let appURL = "https://itunes.apple.com/app/id1440611372"
}
print(Unwrap.appURL)


struct NewsStory {
	static var breakingNewsCount = 0
	static var regularNewsCount = 0
	var headline: String
	init(headline: String, isBreaking: Bool) {
		self.headline = headline
		if isBreaking {
			NewsStory.breakingNewsCount += 1 // when access the static va rin the struct, have to use NewsStory.breakingNewsCount not just breakingNewsCount
		} else {
			NewsStory.regularNewsCount += 1
		}
	}
}

struct Pokemon {
	static var numberCaught = 0
	var name: String
	static func catchPokemon() {
		print("Caught!")
		Pokemon.numberCaught += 1
	}
}



// Checkpoint 6
// My Solution 
struct CarInfo {
    let model: String
    let seats: Int
    var currentGear = 1
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }
    
    mutating func changeGearsUp() {
            if currentGear < 6 {
                currentGear += 1
            } else {
                currentGear = 6
            }
    }
    mutating func changeGearsDown() {
            if currentGear > 1 {
                currentGear -= 1
            } else {
                currentGear = 1
            }
    }
    
}

var carInfo = CarInfo(model: "Mercedes", seats: 4)
print(carInfo.currentGear)



// Someone else solution I really liked using enums
struct Car {
    let model: String     // constant! probably won't change
    let seatCount: Int    // same!
    private(set) var currentGear = 1  // only change via an internal method.

    enum GearDirection {
        case up, down, neutral
    }

    public mutating func changeGear(_ direction: GearDirection) {
        switch direction {
        case .down : currentGear -= 1
            if currentGear < 1 {currentGear = 1}
        case .up :   currentGear += 1
            if currentGear > 10 { currentGear = 10 }
        case .neutral:
            currentGear = 1  // arbitrary selection
        }
        print("The \(model) is in gear: \(currentGear)")
    }
}
// Test Code
var prefect = Car(model: "Ford Prefect", seatCount: 4, currentGear: 3)
prefect.changeGear(.up)
prefect.changeGear(.neutral) // Jump right to Gear 1.
prefect.changeGear(.down)  // try this line a couple of times. try to get below zero.