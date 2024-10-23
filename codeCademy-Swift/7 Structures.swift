

//***
// Structures
// Used to programmatically represent a real-life object in code
// creates a new type
// a blueprint.template for objects in our program
// start with a struct and change to class if inheritance or reference type is needed
// 
struct Name {
    // Properties
    // Methods
}

struct Dog {
    var age: Int   // properties
    var isGood: Bool
}

struct Book {
    var title: String // properties
    var pages: Int
}


// Default Property Values
// Assigning default values is identical to assigning values to variables
struct Dog {
    var age = 0
    var isGood = true
}

struct Book {
    var title = ""
    var pages = 0
}


// Creating an Instance 
// Creates induvidual objects using a structure
struct Dog {
    var age = 0
    var isGood = true
}
var eloise = Dog()
print(eloise)


// Accessing and Editing Properties
// instances of a struct can have different property values. 
// Access them with an instance.property syntax
struct Dog {
    var age = 0
    var isGood = true
}
var eloise = Dog()
eloise.age = 7
print(eloise)
print(eloise.isGood)


// The Init Method
// Methods are functions specific to a type (structure)
// init()
// doesnt need params but can take them
// uses the self keyword to refer to itself
struct Dog {
    var age: Int
    var isGood: Bool
    init(age: Int, isGood: Bool) {
        self.age = age
        self.isGood = isGood
    }
}
var bucket = Dog(age: 4, isGood: true)
print(bucket.age)   
print(bucket.isGood)
//
struct Book {
  var title: String
  var pages: Int
  init(title: String, pages: Int) {
    self.title = title
    self.pages = pages
  }
}
var theHobbit = Book(title: "The Hobbit", pages: 300)
print(theHobbit)


// Memberwise Intialization 
// in certain cases we dont need init() 
// structures also come with built-in initializer 
struct Dog {
  var age: Int
  var isGood: Bool
}
var eloise = Dog(age: 5, isGood: true)
//
struct Book {
  var title: String
  var pages: Int
}
var theHobbit = Book(title: "The Hobbit", pages: 300)
print(theHobbit)


// Structure Methods
// functions that are within the scope of the structure
struct Dog {
    var age: Int
    var isGood: Bool

    init(age: Int, isGood: Bool) {
        self.age = age
        self.isGood = isGood
    }

    func bark() {
        print("bork")
    }
}
var eloise = Dog(age: 4, isGood: true)
eloise.bark()
//
struct Band {
  var genre: String
  var members: Int
  var isActive: Bool
  
  init(genre: String, members: Int, isActive: Bool) {
    self.genre = genre
    self.members = members
    self.isActive = isActive
  }
  
  func pumpUpCrowd() -> String {
    if self.isActive == true {
      return "Are you ready to ROCK?"
    }
    else {
      return "..."
    }
  }
}
var fooFighters = Band(genre: "rock", members: 6, isActive: true)
print(fooFighters.pumpUpCrowd())



// Mutating Methods
// How to change an instances properties using an Instance Method
struct Dog {
    var age: Int
    var isGood: Bool

    init(age: Int, isGood: Bool){
        self.age = age
        self.isGood = isGood
    }

    mutating func birthday() -> Int {
        print("Best doggy")
        self.age += 1
        return self.age
    }
}
var eloise = Dog(age: 10, isGood: true)
var newAge = eloise.birthday()
print(newAge)
//
struct Band {
  var genre: String
  var members: Int
  var isActive: Bool
  
  init(genre: String, members: Int, isActive: Bool) {
    self.genre = genre
    self.members = members
    self.isActive = isActive
  }
  
  func pumpUpCrowd() -> String {
    if self.isActive {
      return "Are you ready to ROCK?"
    } else {
      return "..."
    }
  }
  mutating func changeGenre(newGenre: String) -> String {
    self.genre = newGenre
    return self.genre
  }
}
var journey = Band(genre: "jazz", members: 5, isActive: true)
var bandsNewGenre = journey.changeGenre(newGenre: "rock")
print(bandsNewGenre)


// Type
// type(of: variable)

struct Dog {
  var age = 0
  var isGood = true
}
var eloise = Dog()
print(type(of: eloise))

struct Pets {
  var petDog: Dog // used after the Dog struct
  var petCat: Cat // Need to make a Cat struct!
}


// Structures are Value Types
// data types can be value typs or reference types
// meaning different data types are stored and accessed in different ways
// meaning every time an instance is created or copied the instance has its own set of unique values
struct Dog {
  var age = 0
  var isGood = true
}
var youngDog = Dog(age: 5, isGood: true) 
var oldDog = youngDog // oldDog stores the values of youngDog and is its own instance
oldDog.age = 10 

print(oldDog.age)   // Prints: 10
print(youngDog.age) // Prints: 5
//
struct Finch {
    var lengthInCm: Double
    var nestLocation: String

    init(lengthInCm: Double, nestLocation: String) {
        self.lengthInCm = lengthInCm
        self.nestLocation = nestLocation
    }
}

var groundFinch: Finch = Finch(lengthInCm: 15.0, nestLocation: "Bush")
var cactusFinch: Finch = groundFinch
cactusFinch.nestLocation = "Cactus"

print(cactusFinch.nestLocation)
print(groundFinch.nestLocation)


// REVIEW 
// Structures are a means of modeling real-life objects programmatically.
// How to create a structure using the struct keyword along with properties and methods.
// Structure properties are used to describe the characteristics and values of the structure.
// To model individual objects, we can create instances of structs, which may have unique property values.
// We can access and edit properties using dot notation.
// If we know that most of our instances will have a specific property value, we can assign default property values inside the struct.
// Using the init() method allows us to provide an instance with specific values for the structure’s given properties.
// Even without an init() method, structs come with a default memberwise initialization method that can assign values to declared properties inside a struct.
// Structures can have methods that are functions accessible to their instances.
// Structures are value types, any copied struct that has its properties altered will not affect the original structure from which it was copied.



// Structured Gym Regimen
// 1st structure keeps track of:
// its name. what muscle groups it targets.
// how many repetitions (reps) we should do in one go.
// how many rounds of repetitions we should do (sets). How many total reps we’ll be doing.
// 2nd structure to keep track of all the exercises: 
// track the day of the week.
// store the exercises we should do for a given day.
// include a method to remind us of a given day’s workout regimen.
struct Exercise {
  var name: String
  var muscleGroups: [String]
  var reps: Int
  var sets: Int
  var totalReps: Int

  init(name: String, muscleGroups: [String], reps: Int, sets: Int) {
    self.name = name
    self.muscleGroups = muscleGroups
    self.reps = reps
    self.sets = sets
    self.totalReps = sets * reps
  }
}
var pushUp: Exercise = Exercise(name: "Push up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 35, sets: 5)
var squats = Exercise(name: "Squat", muscleGroups: ["Legs", "Glutes"], reps: 50, sets: 10)
var pullUp = Exercise(name: "Pull Up", muscleGroups: ["Biceps", "Back"], reps: 10, sets: 3)

struct Regimen {
  var dayOfWeek: String
  var exercises: [Exercise]

  init(dayOfWeek: String, exercises: [Exercise]) {
    self.dayOfWeek = dayOfWeek
    self.exercises = exercises
  }

  func printExercisePlan() {
    print("Today is \(self.dayOfWeek) and the plan is to: ")
    for exercise in self.exercises {
      print("Do \(exercise.sets) sets of \(exercise.reps) \(exercise.name)s")
      print("That's a total of \(exercise.totalReps) \(exercise.name)s")
    }
  }
}
var mondayRegimen: Regimen = Regimen(dayOfWeek: "Monday", exercises: [pushUp, squats])
print(mondayRegimen.printExercisePlan())


// Add a mutating method to the Regimen structure to add exercises.
// Fix for Loop to display totals together