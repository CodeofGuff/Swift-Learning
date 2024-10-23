
//***
// Learning Swift Variables 

// Data Types - 
// Int: integer numbers
// Double: floating-point numbers
// String: a sequence of characters
// Bool: true/false values

// Compound Assignment Operaters - 
// += add and assign the sum.
// -= subtract and assign the difference.
// *= multiply and assign the product.
// /= divide and assign the quotient.
// %= divide and assign the remainder.


// Declaring a type annotation  with a Colon : and the Type (String, Double, Int, Bool
// Contasntants - written as 'let' , their values cannot be reassigned
// Varibles written as 'var' , can have their values manipulated

let amount: Double = 18.50
var tip: Double = amount * 0.23
print("The tip amount will be:", tip, "and total will be:", tip + amount)

var badTip: Double = tip
badTip /= 2
print("Adjusted tip for bad service:", badTip)


// String Interpolation uses a \() in a string to insert a var
var goodTip: Double = tip
goodTip = amount * 0.35
print("Adjusted the tip to \(goodTip) for excellent service!")


// Dog(Cat) Years Project 
var catAge: Int = 4  // Maples age
var earlyYears: Int = 21  // first 2 years count as 21
var laterYears: Int = (catAge - 2) * 4 // each following year age
var humanYears: Int = earlyYears + laterYears
print("My name is Maple! Meow! I am \(humanYears) years old in human years.")


// Quadratic Formula 
var a: Double = 2.0
var b: Double = 5.0
var c: Double =  3.0
var root1: (Double) = (b*b - 4*a*c)
root1 = root1.squareRoot()
root1 = -b + root1
root1 = root1 / (2 * a)

var root2: Double = (-b - (b*b - 4*a*c).squareRoot()) / (2*a) // all root1 mods written inline

print("Root 1 =", root1, " : ", "Root 2 =", root2)


// Piggy Bank
var pesos: Double = 5000
var reais: Double = 6000
var soles: Double = 7000

var pDols: Double = pesos * 0.00029 // Peso equals 0.00029 USD
var pRea: Double = reais * 0.24 // Real equals 0.24 USD
var pSol: Double = soles * 0.29 // Sol equals 0.29 USD

var total: Double = pDols + pRea + pSol

print("US Dollars = $\(total)")

