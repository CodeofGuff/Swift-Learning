

//***
// Logic Operators 
// determine a boolean result after combining or modifying true or false values. 


// && (AND)
// || (OR)
// ! (NOT)


// && or AND operator
// evaluates two operands and returns a Boolean result. 
// It returns true only when both operands are true and returns false when at least one operand is false.
var time: Int = 1900
var phoneInUse: Bool = true
var brightness: Double
if time >= 2000 && phoneInUse {
    brightness = 0.75
    print(brightness)
}
else {
    brightness = 1
    print(brightness)
}

var time = 1200
var alarmSet: Bool = true
if time == 1200 && alarmSet {
    print("WAKE UP!!")
}


// || or OR operator
// evaluates two operands and returns a Boolean result. 
// It returns true when at least one operand is true and false only when both operands are false. 
var snowing: Bool = false
var raining: Bool = true
if snowing || raining {
    print("Tis moist")
}


// ! or NOT operator 
// a prefix operator that negates, or reverses, the Boolean value of its operand. 
// It returns true, when the operand is false and false when the operand is true. 
// can neagte the value of an expression, as long as it is contained in parentheses !()
let a: Bool = true
let b: Bool = false
print(!a)
print(!b)
print(!(true && false)) // Prints: true as true && false == false

var feelingWell = true
if !feelingWell {
  print("Have some vitamins and take care of yourself 🤒")
  } 
else {
print("Embrace the day!")
}


// Combining Logical Operators 
// We can combine or chain logical operators, &&, ||, and ! in order to create longer, more complex compound expressions.
// && or AND operator is always executed first regardless of order. 
let weekday: Bool = true
let dayOff: Bool = false
let weekend: Bool = false
if weekday && dayOff || weekend { // executes AND operator && FIRST ALWAYS.  weekday && dayOff = FALSE || weekend = FALSE  ---  FALSE = FALSE so prints ELSE
    print("Weekend! Woop it up!")
}
else {
    print("You're a bartender weekdays don't matter")
}

var correctPassword = false
var lessThanThreeTries = true 
var accessThroughTouchID = true
var unlock: Bool
if correctPassword && lessThanThreeTries || accessThroughTouchID {
  unlock = true
}
else {
  unlock = false
}
print(unlock)



// Controling Order of Execution
// Instead of relying on the compiler to set operator precedence, 
// we can do so ourselves by wrapping a logical expression in parentheses, ()
let bool1: Bool = (true || false) || false || false // will execute (true || false) first
let bool2: Bool = !true || (false && false || true)
let bool3: Bool = !(false && true) && (false || false)
print(bool1) 
print(bool2) 
print(bool3) 



// Review 
// The logical && operator translates to AND and returns true only when both operands are true. It returns false in all other cases.
// The logical || operator translates to OR and returns true when either operands are true. When both operands are false, the logical expression evaluates to false.
// The logical ! operator translates to NOT and negates a Boolean value.
// The && operator has a higher precedence over the || operator.
// Parentheses, (), may be used in a logical expression to control the order of operations and improve readability.

//Magic 8-Ball
let playerName: String = "David"
let playerQuestion: String = "To smoke or not to smoke"
let randomNumber: Int = Int.random(in: 1...9)
let eightBall: String 
switch randomNumber {
    case 1:
        eightBall = "Yes - definitely"
    case 2:
        eightBall = "It is decidely so"
    case 3:
       eightBall = "Without a doubt"
    case 4:
       eightBall = "Reply hazy, try again"
    case 5:
        eightBall = "Ask again later"
    case 6:
        eightBall = "Better not tell you now"
    case 7:
        eightBall = "My sources say no"
    case 8:
        eightBall = "Outlook not so good"
    case 9:
        eightBall = "Very doubtfull"
    default:
        eightBall = "ERROR"
}

if playerName.isEmpty {
    print("Please enter your name, Human")
} 
else {
    print("\(playerName) asks: \(playerQuestion)")
    print("Magic 8-Ball says: \(eightBall)")
}
