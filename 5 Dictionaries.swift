
//***
// Dictionaries
// An unordered collection of paired data. The paired data is commonly referred to as a key-value pair in which a key is a unique identifier for their associated value.


// Empty Dictionaries
// A dictionary with no key: value pairs
// literal syntax:
var dictionaryName: [KeyType: ValueType] = [:] // using [:] to signify empty
// intitalizer syntax:
var dictionaryName = [KeyType: ValueType]() 

var emptyLiteral: [String: Int] = [:] // PREFFERED WAY
var emptyInitializer: [String : Bool] = [String: Bool]()


// Creating Dictionaries initialized with elements
// an element refers to a single key: value pair
var dictionaryName: [KeyType: ValueType] = [
  Key1: Value1,
  Key2: Value2,
  Key3: Value3
]

var bagItems: [String: Int] = [
    "Rope": 5,
    "Belt": 7,
    "Candle": 10
]


// Type Inference
// Remove the type annotation from the initialization - [String: Int]
var bagItems = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10
]

var movieYears = ["Finding Nemo": 2003, "Toy Story": 1995] // VSCode automatically places the [String: Int] annot
print(movieYears)


// Adding Elements
dictionaryName[NewKey] = NewValue

var bagItems = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10
]
bagItems["Coins"] = 15
bagItems["Snacks"] = 3


// Updating Elemnts
// Subscript Syntax: 
dictionaryName[Key] = NewValue
// or the .udapteValue() method with:
dictionaryName.updateValue(NewValue, forKey: Key) 
var bagItems = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10
]
bagItems["Belt"] = 8
bagItems.updateValue(12, forKey: "Candle")
print(bagItems)


//Removing Elements using nil
// Can also use the .removeAll() method
dictionaryName[Key] = nil
// or .removeValue method
dictionaryName.removeValue(forKey: Key)
var bagItems = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10
]
bagItems["Rope"] = nil
bagItems.removeValue(forKey: "Belt")
print(bagItems)


// Inspecting a Dictionary
// .isEmpty returns true or false and .count returns the number of elements inside
dictionaryName.isEmpty
dictionaryName.count
var numberOfSides = [
  "triangle": 3,
  "square": 4,
  "rectangle": 4,
  "decagon": 10,
  "triacontagon": 30
]
if numberOfSides.isEmpty {
    print("This dictionary has no elements in it.")
}
else {
    print(numberOfSides.count)
}


// Accessing Values - with Optionals
// subscript syntax with an if-let statement to check if it exists
// This is also known as COnditional Unwrapping (BELOW)
// if-let statements are used to check if a real value exists inside of an optional. 
// If the value exists, the optional will be unwrapped and assigned to a variable.
// Using ! forces the compiler to unwrap an optional value and interpret the value as 
// its appropriate data type; 
// however, it should be noted that errors can occur when using ! on a value that does not exist.
var bagItems = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10,
    "Coins": 15 // remove to print 'null'
]
if let coinsSpecific = bagItems["Coins"] {
    print("You have \(coinsSpecific) coins left!")
}
else {
    print("null")
}

// If there is no need to check for the Key, use at the end of the subscript syntax !
var bagItems = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10,
    "Coins": 15 
]
var coinSpecific = bagItems["Coins"]!
print(coinSpecific)


// Iterating through a Dictionary
// Use Loops!
var bagItems = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10,
    "Medal": 15 
]
for (item, value) in bagItems { // TUPLE
    print("Your \(item) is worth \(value) coins.")
}

var mythology = [
  "Zeus": "Jupiter",
  "Athena": "Minerva", 
  "Poseidon": "Neptune",
  "Demeter": "Ceres"]
for (greekName, romanName) in mythology { // TUPLE
  print("\(greekName) is also known as \(romanName)")
}


// using .keys and .values
// .keys property stores a collection of dictionary keys
// .values property stores a collection of dictionary values
var bagItemsAndValues = [ 
    "Rope": 5,
    "Belt": 7,
    "Candle": 10,
    "Medal": 15 
]
var bagItems: String = ""
for items in bagItemsAndValues.keys {
    bagItems += items
}
print("Your bag items \(bagItems)")

var totalValue = 0 
for value in bagItemsAndValues.values {
    totalValue += value
}
print("your total value is \(totalValue) coins")


// TUPLES (SEE TUPLES DOC FOR EXTENDED INFO, THIS IS EXCLIUSIVE TO DICTIONARIES)
// In dictionaries, tuples are used to iterate over key-value pairs.
var lionKing1994 = [
  "Simba": "Matthew Broderick",
  "Mufasa": "James Earl Jones",
  "Rafiki": "Robert Guillaume"
]
for (character, actor) in lionKing1994 { // TUPLE
  print("\(character) was voiced by \(actor).")
}


// if - let Statments
// An if-let statement is a Swift conditional that is used to unwrap optional values 
// which can then be assigned to variables. 
// optional values - data type that could contain a value or nil (no vlaue)
// Conditional unwrapping uses conditional statements to check if an optional contains a value before assigning the value to a variable. 
// For cnditional unwrapping we use if - let statments
if let newVariable = dictionaryName[optionalValue] {
  // This code will run if the optional contains a real value
}

var animalNames = [
  "Zebra": "Equus quagga",
  "Giraffe": "Giraffa camelopardalis",
  "Elephant": "Proboscidea elephantide"
]
 // var giraffeSci = animalNames["Giraffe"] reuturns an Optional(" ") warning / error

if let giraffeSci = animalNames["Giraffe"] {
  print("A giraffe is also known as a \(giraffeSci).")
} else {
  print("There is no value.")
}






// REVIEW 
// A dictionary is an unordered collection of key-value pairs.
// A key is a unique identifier used to create, update, remove, or access an associated value.
// We can create populated dictionaries using dictionary literals:
// var dictionaryName = [Key1: Value1, Key2: Value2]
// An empty dictionary contains no key-values pairs. There are two methods of initializing an empty dictionary:
// // Initializer Syntax:
// var emptyInitializer = [KeyType: ValueType]()
// // Dictionary Literal Syntax:
// var emptyLiteral: [KeyType: ValueType] = [:]
// We can add elements to a dictionary using subscript syntax:
// We can remove dictionary elements using .removeValue() or by setting a key value to nil.
// We can remove all the values from a dictionary with .removeAll().
// We can update the value of a key-value pair using subscript syntax or .updateValue().
// The .isEmpty property returns a boolean that equals true if a dictionary is empty.
// The .count property returns the number of elements contained within a dictionary.
// We can access a value using its key.
// We can use for-in loops to iterate through the content of a dictionary.
// We can use the .keys property to access only the keys of a dictionary.
// We can use the .values property to access only the values of a dictionary.






// Morse Decoder
var englishText = "this is a secret message"
var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."
var letterToMorse: [String: String] = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--.."
]
var morseText = ""
var decodedMessage = ""
var morseCodeArray = [String]()
var currMorse = ""

for element in englishText {
    if let morseChar = letterToMorse["\(element)"] {
      morseText += morseChar + " "
    }
    else {
      morseText += "   "
    }
}
print(morseText)
// We reach this switch statement only when the value of char is a space. 
// Now we need to figure out if this a space between two Morse code letters or two Morse code words.
// Our default case executes when we’ve reached the end of a Morse code letter.
//  Since we collected all the characters we need, we will append this value to morseCodeArray. 
// Then, we will reset the value of currMorse to "" so we can start building the next Morse code letter.
// The second case will be run if currMorse has a value of a single space (" "). 
// This means that we are working with the second space between two Morse code words. 
// We will reflect this spacing between words by appending a single space (" ") to morseCodeArray.
// Once this is done, we reset currMorse to have a value of "".
// The first case executes when currMorse has an empty String value ("").
// This means we may have hit the first space between two Morse code letters. 
//In this statement, we will change currMorse to have a value of a single space (" ").
// If it is a space between two words, in the next iteration, the second switch case will be true and a space(" ") will be appended to morseCodeArray.
for char in secretMessage {
    if char != " " {
        currMorse.append(char)
    }
    else {
        switch currMorse {
            case "":
                currMorse += " "
            case " ":
                morseCodeArray.append(" ")
                currMorse = ""
            default:
                morseCodeArray.append(currMorse)
                currMorse = ""
        }

    }
}
morseCodeArray.append(currMorse)
print(morseCodeArray)

var morseToLetter: [String: String] = [:]
for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}
print(morseToLetter)

for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue] {
    decodedMessage.append(letterChar)
  }
  else {
    decodedMessage.append(" ")
  }
}
print(decodedMessage)