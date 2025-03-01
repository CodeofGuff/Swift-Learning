

//***
// Loops
// for-in
// while

// for-in Loops
// used to iterate over a sequence of values such as Strings (a sequence of characters), or ranges (a sequence of numbers)
// use stride() func to choose how we want to iterate over a sequence - stride(from: a, to: b, by: c)
print("Why is 6 afraid of 7? Because ...")
for i: Int in 7...9 {
    print(i)
}
// stride: 
for i: Int in stride(from: 0, to: 12, by: 2) {
    print(i)
}
// stride can count backwards
print("We are staring in...")
for i in stride(from: 3, to: 0, by: -1) {
    print(i)
}  
print("BEGIN!")


// Iterating through Strings
var quote: String = "our whole life is solving puzzles."
for c: Character in quote {
    print(c)
    if c == "z"{
        print("^ Z!!!")
    }
}

var funFact: String = "exlxephxxxaxnts xcaxxn'xxt xxxjxumxpx."
for char: Character in funFact {
  if char != "x" {
    print(char)
  }
}


// Using Underscore OR _
// used in place of a placeholder? a placeplaceholder?
// we wouldn't use num or n because there is no num or n in our loop body.
// So _ replaces that. 
for _ in 1...10 {
    print("I will be a developer/engineer")
}


// Continue 
// Used to tell our loop to skip values
let challenge: String = "bring it"
for char: Character in challenge {
  switch char {
    case "a", "e", "i", "o", "u":
      continue // checks if Char has any of the case values, and if so, skips with continue
    default:
      print(char)
  }
}

for num in 1...9 {
  if num % 2 != 0{ 
    continue
  }
  print(num)
}
print("Who do we appreciate?")
print("YOU!")


// Break
// Used to exit out of a loop. Usually when a condition is met
let respect = 556
for pageNum in 1...1000 {
    if pageNum == respect {
        print("Respect found on page \(pageNum): Find out what it means to me")
        break
    }
    print("On page \(pageNum) and still no 'respect'.")
}

var guessedNum = Int.random(in: 1...15)
for counter in 1...15 {
    if counter == guessedNum {
        print("It's \(guessedNum)!!")
        break
    }
    print("Is it \(counter)?")
}


// While Loops
// iterates as long as the condition is true
// good for situations where we don't know ho wlong we need to loop for
var total = 0
var counter = 0
while total < 50 {
    let diceRoll = Int.random(in: 1...6)
    total += diceRoll
    counter += 1 // added a counter to see how many times the dice were rolled
    print(diceRoll)
}
print(total)
print(counter)
print("You rolled you die a total of \(counter) times, to reach your total of: \(total)")


// WHILE vs IF
var guess = Int.random(in: 1...10)
var magicNum = Int.random(in: 1...10)
while guess != magicNum {
  guess = Int.random(in: 1...10)
  magicNum = Int.random(in: 1...10)
  print("You guessed \(guess), and the number was \(magicNum)")
}
print("You're right it was \(guess)!")
// CAN WRITE IT WITHOUT A WHILE LOOP LIKE
var guess = Int.random(in: 1...10)
var magicNum = Int.random(in: 1...10)
    if guess != magicNum {
        print("You guessed \(guess), and the number was \(magicNum). Bad luck!")
    }
    else {
        print("You're right!! It was \(guess)!")
    }



// Review
// for-in loops are used to iterate over collection items like ranges and strings.
// stride() creates a range that we can customize.
// _ usage when we don’t need to use the placeholder variable.
// continue allows us to move on to the next value.
// break stops the loop before the stopping condition is met.
// while loops are used when we don’t know how many times we’re looping.

// Whale Talk 
var input: String = "I hope I make it!"
var output: String = ""
for char: Character in input {
  let lowerChar: String = char.lowercased()
  switch lowerChar {
    case "a", "i", "o":
      output += lowerChar.uppercased()
    case "e":
      output += "EE"
    case "u":
      output += "UU"
    default:
      continue
  }
}
print(output)


// 99 Bottles
var numBottles = 5
while numBottles > 0 {
  print("\(numBottles) bottles of milk on the wall, \(numBottles) bottles of milk!")
  numBottles -= 1
  print("You take one down and pass it around... \(numBottles) bottles of milk on the wall!")
}
print("0 Bottles left! OH GOD PanIC THE DARK ON AWAKENS!!! GO BUY MORE MILK NOW!")


// Fizz Buzz
for counter in 1...100 {
  if counter % 5 == 0 && counter % 3 == 0 {
      print("FizzBuzz")
  }
  else if counter % 3 == 0 {
    print("Fizz")
  }
  else if counter % 5 == 0 {
      print("Buzz")
  }
  else {
    print(counter)
  }
}

