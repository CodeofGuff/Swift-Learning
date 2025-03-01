
//***
// Optionals
// either contain a value or nil


// Defining Optionals
// defined with a question mark ? 
// Optionals can be assigned to either nil or an instance of the optional type.
// Its initial value will be nil unless you assign a value yourself:

var firstLetter: Character? 
print(firstLetter) // nil

firstLetter = "a" // Optional("a")
print(firstLetter)

// ANALYZE THESE ERRORS
var hatColor: String? = nil
hatColor = "blue"
hatColor = nil
print(hatColor)


// Force Unwrapping Optionals with !
// once an optional is created, this is how to access the var inside
var a = 4
var b: Int? = 3 // IF THIS IS nil THE PROGRAM WILL CRASH
let sum = a + b!
print(sum)

// Use an if statement to check if nil
var a = 4
var b: Int? = nil
if b != nil {
    let sum = a + b! // UNWRAP WITH !
    print(sum)
} else {
    print("nil")
}

var flightDistance = 1000
var connectinFlightDistance: Int? = 2000
if connectinFlightDistance != nil {
    let totalFlightDistance = flightDistance + connectinFlightDistance! // UNWRAP WITH !
    print(totalFlightDistance)
}


// Optional Binding
// check if a value is not nil in an if statment, then make a new constant that stores the underlying value
var errorMessage: String? = nil
if let errorMessage = errorMessage { // let errorMessage is newly created cont and seperate from the var errorMessage
    print("Error: \(errorMessage)")
} else {
    print("No error message")
}

var firstName = "David"
var lastName = "Guffre"
var suffix: String? = nil
if let suffix = suffix {
    print("Hello \(firstName) \(lastName) \(suffix)")
} else {
    print("Hello \(firstName) \(lastName)")
}


// Multiple Optional Bindings
// if let statements are a great way to handle optional values
// we can bind them into a single statement instead of a bunch of nestetd if lets, remove the IFs and {} replace with a comma , 
if let a = a, let b = b, let c = c, shouldPrintSum {
    print(a + b + c)
}
if  let a: Int = a, 
    let b: Int = b,
    let c: Int = c,
    shouldPrintSum {
        print(a + b + c)
    }

var language = "Swift"
var firstRelease: Int? = 2014
var website: String? = "swift.org"
var designer: String? = "Chris Lattner"
var shouldDisplayMessage = true

if  let firstRelease = firstRelease, 
    let website = website, 
    let designer = designer, 
    shouldDisplayMessage {
    print("""
        \(language) was first released in \(firstRelease).  
        Its website can be found at \(website).
        It was designed by \(designer).
        """)
}


// Guard statements
// another way to avoid overly nested code
// must have an else statement and exit the current scope. 
func greetUser(isAuthenticated: Bool) {
    guard isAuthenticated else { // if isAuthenticated is true, exec code, else printError then reuturn
        print("Error: user is not authenticated")
        return
    }
    print("Hello user!")
}

//They can be used to exit the scope of loops as well
var nums = [3, 1, 0, 6]
for num in nums {
    guard num != 0 else {
        print("Can't divide \(num) by zero!")
        continue
    }
    print("10 / \(num) = \(10 / num)")
}

// They can be used to bind optionals just like if let statements, and support multiple assignments
func addOptionals(shouldPrintSum: Bool) {
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3

    guard let unwrappedA = a, 
          let unWrappedB = b,
          let unWrappedC = c, 
          shouldPrintSum else {
          return
    }
    print(unwrappedA + unWrappedB + unWrappedC)
}
addOptionals(shouldPrintSum: true)


func runProgram() {
    let language = "Swift"
    let firstRelease: Int? = 2014
    let website: String? = "swift.org"
    let designer: String? = "Chris Lattner"
    let shouldDisplayMessage = true

    guard let unwrappedRelease = firstRelease, 
          let unwrappedWebsite = website, 
          let unwrappedDesigner = designer, 
          shouldDisplayMessage else {
            return
            }
            print(
                """
                \(language) was first released in \(unwrappedRelease).  
                Its website can be found at \(unwrappedWebsite).
                It was designed by \(unwrappedDesigner).
                """)
}
runProgram()


// Nil-Coalescing Operator ??
// allows us to provide a default value if the optional is nil
// syntax optionalVal ?? defaultVal, same type as the optional. 
var userLocation: String? = "Home"
let displayedLocation = userLocation ?? "Unknown"
print(displayedLocation)
//IF NIL 
var secondUserLocation: String?
var secondDisplayLocation = secondUserLocation ?? "Unknown"
print(secondDisplayLocation)

var favoriteFood: String?
print(favoriteFood ?? "No Favorite Food")


// Optional Chaining with ?
// chaining properties and method calls on a var
var studentGovernment = [
    "president": "Shristi",
    "treasurer": "Diego"
]
if let presidentsNameLength = studentGovernment["president"]?.count { // access president in studentGovernment and counts the chars. 
  print("The president's name is \(presidentsNameLength) characters long")
}
if let vicePresidentNameLength = studentGovernment["vicePresident"]?.count {
  print("The vice president's name is \(vicePresidentNameLength) characters long")
} else {
  print("There is no vice president")
}


// Optionals and Functions
// optionals are types just like Array and String, we can use them in the signature of a function
// usefull as there may not always be a good value to return


let words = ["optionals", nil, "are", "great", nil, "at", "handling", nil, "values"]

func firstIndex(of target: String, in arr: [String?]) -> Int? {
  for i in arr.indices {
    guard let value = arr[i], value == target else { continue }
    return i
  }
  return nil
}

if let greatIndex = firstIndex(of: "great", in: words) {
  print(greatIndex)
}

if let badIndex = firstIndex(of: "bad", in: words) {
  print(badIndex)
} else {
  print("words does not contain the string 'bad'")
}


// REVIEW 
// Great work! By using optionals, you can make sure to handle values that might be nil. 
// A value might be nil because the user didn’t provide a response. 
// A value might also be nil because we might not have a good answer to a question (e.g. what’s the biggest number in an empty list).
// In this lesson you learned how to:
// Define optionals
// Force unwrap optionals using the ! operator
// Bind optionals using if let statements
// Bind optionals using guard statements
// Use the nil-coalescing operator ?? to provide default values
// Chain optionals using the ? operator
// Define functions that take in and return optionals

var emptyArr: [Int] = []

print(emptyArr.first ?? "No first value")
print(emptyArr.last ?? "No last value")
print(emptyArr.randomElement() ?? "No random value")
print(emptyArr.max() ?? "No maximum value")
print(emptyArr.min() ?? "No minimum value")
print(emptyArr.firstIndex(of: 4) ?? "4 is not in the array")
print(emptyArr.popLast() ?? "No values to pop from an empty array")


// School Database
//
struct Teacher {
    let id: Int
    let name: String
    var hairColor: String?
    var email: String?
}

struct Student {
    let name: String
    let favoriteTeacherID: Int
}

struct School {
    let name: String
    let teachers: [Teacher]

    func getTeacher(withID id: Int) -> Teacher? {
        for teacher in teachers {
            if teacher.id == id {
                return teacher
            }
        }
        return nil
    }
    
    func printFavoriteTeacherInfo(for student: Student) {
        guard let favoriteTeacher = getTeacher(withID: student.favoriteTeacherID) else {
            print("No teacher with the id \(student.favoriteTeacherID) works at \(name)!")
            return
        }
        print("\(student.name)'s favorite teacher is \(favoriteTeacher.name)")
        print("They have \(favoriteTeacher.hairColor ?? "no") hair")
        guard let email = favoriteTeacher.email else {
            print("They don't have an email address on file")
            return
        }
        print("Their email address is \(email)")
    }
}


let teachers = [
    Teacher(id: 592, name: "Mr. Weatherbee", hairColor: nil, email: "thebee@riverdale.com"),
    Teacher(id: 481, name: "Ms. Grundy", hairColor: "white", email: nil),
    Teacher(id: 688, name: "Mr. Adams", hairColor: "black", email: "arthurAdams@riverdale.com")
]

let riverdaleHigh = School(name: "Riverdale High", teachers: teachers)

let archie = Student(name: "Archie Andrews", favoriteTeacherID: 481)
let betty = Student(name: "Betty Cooper", favoriteTeacherID: 443)

riverdaleHigh.printFavoriteTeacherInfo(for: archie)
riverdaleHigh.printFavoriteTeacherInfo(for: betty)