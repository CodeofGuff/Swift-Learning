//Day12


// How to create Classes
// Classes are similar to structs(strycts store most data stypes)

// Differ from structs in 5 main ways:
//Classes do not come with synthesized memberwise initializers.
//One class can be built upon (“inherit from”) another class, gaining its properties and methods.
//Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
//Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
//Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.

//The other points matter, but are of varying use:
//Being able to build one class based on another is really important in Apple’s older UI //framework, UIKit, but is much less 
// common in SwiftUI apps. In UIKit it was common to have long class hierarchies, 
// where class A was built on class B, which was built on class C, which was built on class D, etc.
//Lacking a memberwise initializer is annoying, but hopefully you can see why it would be tricky to implement 
// given that one class can be based upon another – if class C added an extra property it would break all the initializers for C, B, and A.
//Being able to change a constant class’s variables links in to the multiple copy behavior of classes: 
// a constant class means we can’t change what pot our copy points to, but if the properties are variable we can still 
// change the data inside the pot. This is different from structs, where each copy of a struct is unique and holds its own data.
//Because one instance of a class can be referenced in several places, it becomes important to know when the final copy has been destroyed. 
// That’s where the deinitializer comes in: it allows us to clean up any special resources we allocated when that last copy goes away.

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}
var newGame = Game ()
newGame.score += 10


class BoardGame {
	var name: String
	var minimumPlayers = 1 // default value so no need for init
	var maximumPlayers = 4
	init(name: String) {
		self.name = name
	}
}


class TIE {
	var name: String
	var speed: Int
	init(name: String, speed: Int) {
		self.name = name
		self.speed = speed
	}
}
let fighter = TIE(name: "TIE Fighter", speed: 50)
let interceptor = TIE(name: "TIE Interceptor", speed: 70)


class ThemePark {
	var entryPrice: Int
	var rides: [String]
	init(rides: [String]) {
		self.rides = rides
		self.entryPrice = rides.count * 2 // is given a value so no need to decare as param
	}
}



// Class Inheritance
// Parent/Super class -> Child/Sub Class
// if a Child/Sub Class wants to change a method from a Super Class, you must use 'override' on the Sub Class's version
// If the class should not let others inherit from it, use 'final' (it can still inherit from others)

//Super Class - Employee
class Employee  {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() { // other classes inherit this func and can call it such as joe.printSummary()
        print("I study \(hours) hours a day")
    }
}
//SubClass - Employee
class Developer: Employee {
    func work() {
        print("I am writing code for \(hours) hours")
    }
    
    override func printSummary() { // this overides the Employee func with david.printSummary()
        print("I am a dev who works or studies \(hours) hours a day, but also really like to game... ")
    }
}
//SubClass - Employee
final class Manager: Employee {
    func work() {
        print("I am going to meetings for \(hours) hours")
    }
}

let david = Developer(hours: 4)
let joe = Manager(hours: 7)
david.work()
joe.work()
david.printSummary()
joe.printSummary()



// Adding inits to Classes
// If a Sub Class has any custom inits, it must always call the Supers inits AFTER it has finished setting up its own props
// to ask the Super Class of a Sub Class to run its own init use super.init(: )
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) // asking the Super Class to run its own init
    }
    
}

let teslaX = Car(isElectric: true, isConvertible: false)


// if a Sub Class does not need custom inits, it will auto inherit the inits of the Super Class.
// replace tjhe above code and call with this and it works:
class Car: Vehicle {
    let isConvertible = false
}
let teslaX = Car(isElectric: true)


// Valid inheritance: 
class Handbag {
	var price: Int
	init(price: Int) {
		self.price = price
	}
}
class DesignerHandbag: Handbag {
	var brand: String
	init(brand: String, price: Int) {
		self.brand = brand
		super.init(price: price)
	}
}

class Dog {
    var breed: String
    var isPedigree: Bool
    init(breed: String, isPedigree: Bool) {
        self.breed = breed
        self.isPedigree = isPedigree
    }
}
class Poodle: Dog {
    var name: String
    init(name: String) {
        self.name = name
        super.init(breed: "Poodle", isPedigree: true)
    }
}
let fluffy = Poodle(name: "Fluffy")
print("My dog \(fluffy.name) is a \(fluffy.breed) kind of dog!")



// Copying Classes
// All copies of a Class Insts chare the same data
// Unique copies of a class instanse (user 2, user 3) are also called Deep Copies
class User {
    var userName = "Anon"
    
    func copy() -> User { // this func allows us to use it on a copy of a class and make sure each one sis unique, like a struct
        let user = User()
        user.userName = userName
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.userName = "Taylor"
var user3 = user2.copy()
user3.userName = "David"
print(user1.userName)
print(user2.userName)
print(user3.userName)


//Prints our 9.6 twice
class Starship {
    var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)


// Calling Unique calsses
class BasketballPlayer {
	var height = 200.0
}
var lebron = BasketballPlayer()
lebron.height = 203.0
var curry = BasketballPlayer()
curry.height = 190
print(lebron.height)
print(curry.height)


// Create a DeInit for a Class
// Called when an object is Destroyed
// never take params or return data
// Auto Called when the last copy of a class-inst is detroyed
// Scope refers to anything in brakcets { }

class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id) I am alive!")
    }
    
    deinit {
        print("User \(id): I am dead!")
    }
}

var users = [User]() // Used to save each inst of the for loop
for i in 1...4 {
    let user = User(id: i)
    print("User \(user.id): I am in control!")
    users.append(user) // appends each user to the users array
}
print("Loop is finished!")
users.removeAll() // clears the array, and destroys all the data, calling the deinit
print("Array is clear")


// Variables inside Classes
// Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
// Constant instance, variable property – a signpost that always points to the same user, but their name can change.
// Variable instance, constant property – a signpost that can point to different users, but their names never change.
// Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.
// Classes do not need mutating, as classes can have their vars changed

// const inst, var prop
class User {
    var name = "David"
}
let user = User()
user.name = "Taylor"
print(user.name)


// var inst, var prop
class User2 {
    var name = "David"
}
var user2 = User2()
user2.name = "Taylor"
print(user2.name)
user2 = User2()
print(user2.name)

// const inst, const prop, **INVALID CODE STUDENTS CANNOTT BE CHANGED**
class School {
	let students = 200
	func expel(student: String, for reason: String) {
		print("\(student) has been expelled for \(reason).")
		students -= 1
	}
}
let school = School()
school.expel(student: "Jason", for: "coding during class")

// var  var 
class Phasers {
	var energyLevel = 100
	func firePhasers() {
		if energyLevel > 10 {
			print("Firing!")
			energyLevel -= 10
		}
	}
}
var phasers = Phasers()
phasers.firePhasers()

// var / var struct IE
struct Barbecue {
	var charcoalBricks = 20
	mutating func addBricks(_ number: Int) {
		charcoalBricks += number
	}
}
var barbecue = Barbecue()
barbecue.addBricks(4)



// Classes have lots of things in common with structs, including the ability to have properties and methods, but there are five key differences between classes and structs.
// First, classes can inherit from other classes, which means they get access to the properties and methods of their parent class. You can optionally override methods in child classes if you want, or mark a class as being final to stop others subclassing it.
// Second, Swift doesn’t generate a memberwise initializer for classes, so you need to do it yourself. If a subclass has its own initializer, it must always call the parent class’s initializer at some point.
// Third, if you create a class instance then take copies of it, all those copies point back to the same instance. This means changing some data in one of the copies changes them all.
// Fourth, classes can have deinitializers that run when the last copy of one instance is destroyed.
// Finally, variable properties inside class instances can be changed regardless of whether the instance itself was created as variable.

