//Day10


// Structs part 1
// every piece of UI we design is built on a struct, with lots of structs inside.


// How to create my own Structs

struct Album { // creates a new type call Album
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title), (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "T Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)
print(red.title)
red.printSummary()
wings.printSummary()


struct Employee {
    //properties
    let name: String
    var vacayRemaining = 14 // default value so no need to decalre the param in the initializor
    
    //method
    mutating func takeVacayDays(days: Int) { // since this Func is Writing data (vacayRemaining) it must be mutating
        if vacayRemaining > days {
            vacayRemaining -= days
            print("\(name) is going on vacay for \(days) days!")
            print("After using these they have \(vacayRemaining) Vacay days left.")
        } else {
            print("Oops! Not enough days")
        }
    }
}
// instance of a Struct and the initializor for the struct
var archer = Employee(name: "Sterling Archer") // acher has to be a var as mutating funcs can't change a const
archer.takeVacayDays(days: 5)
print(archer.vacayRemaining)

// Double() wuld be the intializor
let a = 1
let b = 2.0
let c = Double(a) + b
print(c)

// with a default value we can use let as the vacayReaming is defaulted to 14
var kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacayRemaining: 30)
kane.takeVacayDays(days: 3)



// How to Compute Propety values Dynamically
// Property types, stored an computed
// 1. Stored is a var or let that holds a piece of data inside an instance of the struct
// 2. Computed calculates the value of the property dynamically everytime it is accessed
//    Computed props are a blend of stored properties and functions. Accessed like stored properties, but work like functions
// get {} and set {}
// Code that Reads, Code that Writes

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    var vacationRemaining: Int { // computed property with get and set
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue // newValue is auto provided by Swift, stores whatever value the user is trying to assign the property
        }
    }
}
var archer = Employee(name: "Sterling Archer")
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

struct Wine {
	var age: Int
	var isVintage: Bool
	var price: Int {
		if isVintage {
			return age + 20
		} else {
			return age + 5
		}
	}
}
let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)


// How to take action when a Property changes
// Property Observers, special pieces of code that runs when a propeties value changes
// didSet to run when the property is change, (most likely used as we want to know the new value)
// willSet to run before the property is changed
// using a property observer means your functionality will be executed whenever the property changes.

struct Game {
    var score = 0 {
        didSet { // game.score has been changed and it calls this to print the new score
            print("Score is now: \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3

struct App {
    var contacts = [String]() {
        //willSet {
       //     print("Current value is: \(contacts)")
      //      print("New value will be: \(newValue)")
     //  }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}
var app = App()
app.contacts.append("David G")
app.contacts.append("Marissa J")
app.contacts.append("Jon D")
print(app.contacts)


struct BankAccount {
    var name: String
    var isMillionnaire = false
    var balance = 0 {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
    
    init(name: String, balance: Int) { // Have to use a a customer initializer, init() to get the status func to call properly
        self.name = name
        self.balance = balance
        self.isMillionnaire = balance > 1_000_000
    }
    
    func status() -> String {
        if isMillionnaire {
            return "is"
        } else {
            return "is not"
        }
    }
}
var ba = BankAccount(name: "David", balance: 1_000_001)
print("\(ba.name) has \(ba.balance) is their account!")
print("\(ba.name) \(ba.status()) a millionaire")


// How to create Custom Initializers
// Must ensure every property has an initial value by the time the init finalizes
// all properties in an init must have an assigned value like self.name = name or number = Int.random()
struct Player {
    let name: String
    let number: Int
    
    init(name: String) { // no func keywork, no return keyword (always returns a Player type)
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "David G")
print(player.number)
print(player.name)

// moved custom init to an extension to retrain the default memberwise init (to assign Employee(name: "Laure Roslin")
struct Employee {
    var name: String
    var yearsActive = 0
}
extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}
// creating a named employee now works
let roslin = Employee(name: "Laura Roslin")
print(roslin)
// as does creating an anonymous employee
let anon = Employee()

struct Cabinet {
	var height: Double
	var width: Double
	var area: Double
	init (itemHeight: Double, itemWidth: Double) {
		height = itemHeight
		width = itemWidth
		area = height * width
	}
}
let drawers = Cabinet(itemHeight: 2.5, itemWidth: 4.0)
print(drawers.area)

struct Character {
	var name: String
	var actor: String
	var probablyGoingToDie: Bool
	init(name: String, actor: String) {
		self.name = name
		self.actor = actor
		if self.actor == "Sean Bean" {
			probablyGoingToDie = true
		} else {
			probablyGoingToDie = false
		}
	}
}
let char = Character(name: "Boramir", actor: "Sean Bean"
)
print(char)