

//***
// Sets
// Store unique elements of the same data type.
// Sets are unorderd and can print different then the order they were intialized


// Empty Set
var setName = Set<Type>()


// Populated Set 
var setName: Set = [Value1, Value2, Value3]


// .count and .isEmpty
// .isEmpty returns true or false
var vowels: Set = ["A", "E", "I", "O", "U"]
print("There are \(vowels.count) vowels!") 

if vowels.isEmpty { 
    print("This is empty")
}
else {
    print("There are \(vowels.count) vowels here!")
}


// Set Methods 
// .insert() method allows us to insert new elements to our set
// .remove() or .removeAll() (remvoes all lol) method to remove elements
// .contains() method to check if an element exists
var names: Set = ["David", "Marissa"]
names.insert("Chad")
names.insert("Thad")
print(names)

names.remove("Marissa") // names.removeAll() 
print(names)

if names.contains("Thad") {
    print("THADIUS IN THE HOUSSEE!!")
}
else {
    print("The Thad has departed")
}


// Iterating through a set with a for-in Loop
// using .insert() and .remove() methods
var thingsToPack: Set = ["Bathing Suit", "Clothes", "Sunglasses", "Sunscreen", "Favorite Book", "Phone Charger"]
var suitcase: Set = Set<String>()
for item: String in thingsToPack {
    suitcase.insert(item)
}
print(suitcase)

var storeKeep: Set = ["Bow", "Arrows", "Can", "Beer", "Rope"]
var myBag: Set = Set<String>()
print("You visit the local store. The keeper greets you with their wares")
print("View my wares! \(storeKeep)")
print("You have selected Arrows")
for item: String in storeKeep {
    if item == "Arrows" {
        myBag.insert(item)
        storeKeep.remove(item)
    }
}
print("Your bag now contains \(myBag)")
print("The keeper greets you with their wares")
print("View my wares! \(storeKeep)")


// Set Operations 
// We use them to create new sets based on the data within two different sets. 
// This is useful when we are working with multiple data sets.

// .intersection() method to find matching values to two different sets
// .union() combines the sets. can take multiple sets like variable0.union(variable1).union(variable2)
// .symmetricDifference() used to find elements that exist in one of the given sets, but not both
// .subtracting() creates a new set of elements by removing the overlapping data of one set from another set
var newSet = SetA.insertOperator(SetB)

var storeKeep: Set = ["Bow", "Arrows", "Can", "Beer", "Rope"]
var myBag: Set = ["Rope", "Bow", "Ham", "Coins"]
var leftGoods: Set<String> = storeKeep.intersection(myBag)
var stolenGoods: Set<String> = myBag.union(storeKeep)
print("View my wares! \(storeKeep)")
print("Your bag has: \(myBag)")
print("you rob the store!")
print("you make sure not to take the items you already have \(leftGoods)")
print("You're new bag is \(stolenGoods)")

var nintendoSwitch: Set = ["Animal Crossing", "DOOM Eternal", "Stardew Valley"]
var playStation4: Set = ["DOOM Eternal", "Stardew Valley", "The Last of Us"]
var exclusiveGames: Set<String> = nintendoSwitch.symmetricDifference(playStation4)
var nintendoExclusives: Set<String> = nintendoSwitch.subtracting(playStation4)
print(exclusiveGames)
print(nintendoExclusives)


// REVIEW 
// A set is an unordered collection of unique elements.
// We have the option to initialize sets that are either empty or populated:
// var emptySet = Set<Type>()
// var populatedSet: Set = [Value1, Value2, Value3]
// To add new elements to a set, use the built-in method, .insert(Value).
// We can remove a single element from a set using .remove(Value) or we can remove all the values from a set with .removeAll():
// If we want to check if a value exists within a set, we can use the method .contains(Value) .
// A for-in loop can be used to iterate through all the values of a set:
// We can use set operations to modify or create new sets based on the data in two different sets.
// The .intersection() operation creates sets with values that overlap in two sets
// The .union() operation combines all the values of two different sets
// The operation .symmetricDifference() creates a set of items that appear in one set, but not both
// .subtracting() is a set operation that removes the overlapping data of one set from another




// School Roster
var spanish101: Set = ["Angela", "Declan", "Aldany", "Alex", "Sonny", "Alif", "Skyla"]
var german101: Set = ["Angela", "Alex", "Declan", "Kenny", "Cynara", "Adam"]
var advancedCalculus: Set = ["Cynara", "Gabby", "Angela", "Samantha", "Ana", "Aldany", "Galina", "Jasmine"]
var artHistory: Set = ["Samantha", "Vanessa", "Aldrian", "Cynara", "Kenny", "Declan", "Skyla"]
var englishLiterature: Set = ["Gabby", "Jasmine", "Alex", "Alif", "Aldrian", "Adam", "Angela"]
var computerScience: Set = ["Galina", "Kenny", "Sonny", "Alex", "Skyla"]

var allStudents: Set<String> = spanish101.union(german101).union(advancedCalculus).union(artHistory).union(englishLiterature).union(computerScience)

for i: String in allStudents {
  print(i)
}
  print(allStudents.count)

var noLanguage: Set<String> = allStudents.subtracting(german101).subtracting(spanish101)
print(noLanguage)
print(noLanguage.count)

var spanishOrGerman: Set<String> = allStudents.symmetricDifference(spanish101).symmetricDifference(german101)
print(spanishOrGerman)
print(spanishOrGerman.count)

var languageAwardWinners: Set<String> = allStudents.intersection(spanish101).intersection(german101).intersection(englishLiterature)
print(languageAwardWinners)

var sevenPlus: Int = 0 
var classSet: Set = [spanish101, german101, englishLiterature, computerScience, artHistory, advancedCalculus]
for c: Set<String> in classSet {
  if c.count == 7{
  sevenPlus += 1
  }
}
print(sevenPlus)