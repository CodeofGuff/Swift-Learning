
//***
// Arrays and Sets


// Stores and ordered collection of values / data
// ie. list of player scores, list of order prices in a food delivery app



// An Empty Array
// var name = [Type]() 
// Type cannot be changed after being declared and can only hold that type
var subwayAdult: [Int] = [Int]()
var subwayChild: [Int] = [Int]()
print(subwayAdult)
print(subwayChild)


// Array Literal 
// var name = [list of values]
var subwayAdult = [800, 1200, 1500]
print(subwayAdult)

var subwayChild: [Int] = [400, 600, 750]
print(subwayChild)


// Index
// How to retrieve an induvidual value from an array
// 0 indexed like Python
var vowels: [String] = ["a", "e", "i", "o", "u"]
print(vowels[0])


// Properties allow us to access a value that is specific to a particular structure. 
// .count used to give us a number value of elements inside an array
// .append() METHOD adds additional items or use var += [ITEM]
// .insert() METHOD var.insert("i", at: 0) to insert at the specific index
// .remove() METHOD var.remove(at: 3) to remove a certain index
var coinType: [String] = ["Shiney", "Dull", "Painted", "Half"]
print(coinType.count)

coinType.append("Gold")
print(coinType)
// OR
coinType += ["Blue", "Bitten"]
print(coinType)

coinType.insert("Sparkley", at: 0) 
coinType.remove(at: 2) // removes Dull 
print(coinType)



// Iterating over an array with a for-in loop
// for item in arrray {}

var cctips: [Int] = [113, 140, 212, 200]
var catips: [Int] = [25, 80, 15, 40]
var total: Int = 0
for item: Int in cctips { 
    total += item
}
for item: Int in catips {
    total += item
}
print(total)


// REVIEW 
// An array is a list of ordered items.  - var evenNumbers = [2, 4, 6, 8, 10]
// The first index in an array is 0.
// The .count property that returns the size of an array.
// Some of the methods that come with arrays:
// .append(): adding an item to the end
// .insert(): adding an item to an index
// .remove(): removing an item from an index
// The for-in loop can be used to iterate through an array.


// Finds Sum of Even nums and product of Odd nums
var list: [Int] = [2, 4, 6, 1, 7, 9]
var evenSum: Int = 0
var oddProd: Int = 1 // must be 'multiplied by 1'
for item: Int in list {
    if item % 2 == 0 {
        evenSum += item
    }
    else {
        oddProd *= item
    }
}
print("Sum of even numbers is \(evenSum)")
print("Product of odd numbers is \(oddProd)")


// Mixtape
print(".------------------------.")
print("| Theme Tape    90 min   |")
print("|     __  ______  __     |")
print("|    (  )|).....|(  )    |")
print("|    (__)|)_____|(__)    |")
print("|    ________________    |")
print("|___/_._o________o_._\\___|")

var mixtape = [String]() //creates an array that stores String values
mixtape.append("FYS - 1")
mixtape.append("FYS - 2")
mixtape.append("FYS - 3")
mixtape.append("FYS - 4")
mixtape.append("FYS - 5")
mixtape.append("FYS - 6")
mixtape.append("FYS - 7")
mixtape.append("FYS - 8")
mixtape.append("FYS - 9")
mixtape.append("FYS - 0")
print(mixtape)
print(mixtape.count)

mixtape.remove(at: 2)
mixtape.insert("FYS - 69", at: 2)
print(mixtape)

for item in mixtape {
  print(item)
}

print("Side A\n")
for i in 0 ..< mixtape.count/2 {
  print("\(i+1). \(mixtape[i])")
}


print("Side B\n")
for i in mixtape.count/2 ..< mixtape.count {
  print("\(i+1). \(mixtape[i])")
}


// Palindrome
var text: [String] = ["h", "e", "l", "l", "o"] // ["l", "e", "v", "e", "l"]
var reversed: [String] = [String]()
var counter: Int = text.count - 1 // 4
while counter >= 0 {
    reversed.append(text[counter]) // iterate from the end of the text array to its beginning and add each character one by one to reversed.
    counter -= 1
}
if text == reversed { // do the strings match??? 
    print("We have a palindrome!")
}
else {   // if not print this
    print("Not a palindrome. :(")
    print(counter, text, reversed)
}


// Caesars Cipher
// using Character stores induvidual characters, String stores a sequence of characters
var alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var secretMessage: String = "ballsy"
var message: [String.Element] = Array(secretMessage) // array() changes the print from "hello" to and array like "h", "e", "l", "l", "o"
var transMessage = ""

for i: Int in 0..<message.count {
    for j: Int in 0..<alphabet.count {
        if message[i] == alphabet[j] {
            message[i] = alphabet[(j + 3) % 26] // % 26 so that the number can loop over the 26th index
            break
        }
    }
}
for i in message {
    transMessage.append(i)

}

print(message)
print(secretMessage)
print(transMessage)
