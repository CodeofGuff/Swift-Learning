// Day8


// Functions pt 2
// 

// Provide default values for params and adding params to funcs

func printTimesTables(for number: Int, end: Int = 12) { // adding = 12 is the default value
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5, end: 20)
printTimesTables(for: 5) // using the default value = 12



var characters = ["Lana", "David", "Bob", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
// also frees up all the memory assc with the array
// keepingCapacity: true keeps the memory assc with the array
print(characters.count)



// Handling erros in functions
// define an emun with all errors
// write a func mark throws that throws errors
// call them with do, try, catch and ctach all errors.

// creates the password erros Short and Obvious
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String { // throws allows errros to be thrown, if triggered it exits the func
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 { return "OK" }
    else if password.count < 10 { return "Good" }
    else { return "Excellent" }
}

let string = "12345"
do {
    let result = try checkPassword(string) // try must be written before throwable funcs
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Password was to short!")
} catch PasswordError.obvious {
    print("Oh come on now... better than that")
} catch {
    print("There was an error: \(error.localizedDescription)")
}
