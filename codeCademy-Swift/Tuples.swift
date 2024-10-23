

// Tuples

// A data type so use to keep code neat and readable. 
// Importsnt when working with other devs as well as when revisiting old code
// Tuples group together values that are enclosed in parentheses and separated by commas. 
// THEY CAN INCLUDE DIFFERENT YPES OF DATA! (String, Double)

var easyAsPie = ("easy as", 3.14)
var easyAsPie = ("easy as", 3.14)
// access via index
var firstValue = easyAsPie.0   // "easy as"
var secondValue = easyAsPie.1  // 3.14
// access via naming a tuples elements, similar to key: value pairs
var easyAsPie = (saying: "easy as", amount: 3.14)
var firstElementValue = easyAsPie.saying  // "easy as"
var secondElementValue = easyAsPie.amount // 3.14



// For Tuples within Dictionaries. Reference the Tuples portion of the Dictionaries.swift page