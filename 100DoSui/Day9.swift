//Day9


// Closures


// How to create and use closures

let sayHello = { print("Hi there!") } // losure chunk of code we can use as a func in brackets
sayHello()

let sayHello2 = { (name: String) -> String in "Hi \(name)"}// closures have to have all params and return type inside the brackets, sperated by in
print(sayHello2("David"))


// Why are closures Usefull?

func greetUser() {
    print("Hi There!")
}
greetUser()
var greetCopy: () -> Void = greetUser // void means the func returns a nothing type, () means it accept sno params. open/closed brackets returns void or nothing
greetCopy()



func getUserData(for id: Int) -> String { // accepts the for: Int and returns a String, tjhat is its type
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anon"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)



let team = ["Timmy", "Susan", "Piper", "Jon"]
let sortedTeam = team.sorted()
print(sortedTeam)

//Take this func: 
func cptFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Timmy" {
        return true
    } else if name2 == "Timmy" {
        return false
    }
   return name1 < name2
}
 let cptFirstTeam = team.sorted(by: cptFirstSorted)
 print(cptFirstTeam)
// Writen as a Closure it looks liek this: 
let cptFirstTeam = team.sorted(by:{ (name1: String, name2: String) -> Bool in
    if name1 == "Timmy" {
        return true
    } else if name2 == "Timmy" {
        return false
    }
    return name1 < name2
})
print(cptFirstTeam)

// Write a closure when you dont want to write a seperate func for a single thing, like sorting this list.

let payment = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}


// Use trailing closures and shorthand syntax

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

//REWRITE THIS CODE BLOCK LIKE BELOW
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})
print(captainFirstTeam)
// Swift knows we are returning a Bool and needs two Strings,
// swift provides param names so can use $0, $1
let captainFirstTeam2 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}
let reverseTeam = team.sorted { $0 > $1 } // we do not need to (), or by: or any other factors for our shorthand
print(captainFirstTeam2)
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") } // runs the {} on every index in the array.
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() } // map can return an array of Ints, Strings, doesnt matter for map
print(uppercaseTeam)


// Trailing closure syntax is designed to make Swift code easier to read, although some prefer to avoid it.
// Let’s start with a simple example first. Here’s a function that accepts a Double then a closure full of changes to make:
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}
//We can call that function without a trailing closure like this:
animate(duration: 3, animations: {
    print("Fade out the image")
})
//That’s very common. Many people don’t use trailing closures, and that’s OK. But many more Swift developers look at the }) at the end and wince a little – it isn’t pleasant.
// Trailing closures allow us to clean that up, while also removing the animations parameter label. That same function call becomes this:
animate(duration: 3) {
    print("Fade out the image")
}
// Trailing closures work best when their meaning is directly attached to the name of the function – 
// you can see what the closure is doing because the function is called animate().

// Writing Func that accept Funcs as Params


func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)
// or
func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

// trailing closures, If a Functions final Params are Funcs, you can use trailing closure syntax

func repeatAction(count: Int, action: () -> Void) {
    for _ in 0..<count {
        action()
    }
}
repeatAction(count: 5) {
    print("Hello, world!")
}

func tendGarden(activities: () -> Void) {
	print("I love gardening")
	activities()
}
tendGarden {
	print("Let's grow some roses!")
}

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done")
}

doImportantWork { // trailing closures
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


// Using a closure to send back data rather than returning a value from the function means
// Siri doesn’t need to wait for the function to complete, so it can keep its user
// interface interactive – it won’t freeze up.
