

//***
// Classes
// like a structure, it serves as a blueprrint/template for an object. 
// defines the characteristics and behaiviors of an object
// difference between a struct: 
// Inheritance - enables classes to inherit each others characteristics
// Classes are reference types, structures are value types
// i.e. Use an exisitng Employee ID badge to create a Manager ID badge with higher clearence



// Creating a Class
class Name {
    // properties
    // methods
}

class Restaurant {
    var name = ""
    var type = [""]
    var rating = 0.0
    var delivery = false
}

// Creating and instance
// the term "object" is used to refer to an instance of a class
// the class is just the blueprint
class Restaurant {
    var name = ""
    var type = [""]
    var rating = 0.0
    var delivery = false
}
var bobsBurgers = Restaurant()
bobsBurgers.name = "Bob's Burgers"
bobsBurgers.type = ["Burgers", "Fast Food"]
bobsBurgers.rating = 3.5
bobsBurgers.delivery = true
print(bobsBurgers.name, bobsBurgers.type, bobsBurgers.rating, bobsBurgers.delivery)


// init() method
// you will need to define an init() method when you require custom 
// initialization logic, have properties without default values, 
// or want to provide additional convenience initializers.

class Restaurant {
    var name = ""
    var type = [""]
    var rating = 0.0
    var delivery = false

    init(name: String, type: [String], rating: Double, delivery: Bool) {
        self.name = name
        self.type = type
        self.rating = rating
        self.delivery = delivery
    }
}
var laRatatouille = Restaurant(name: "la Ratatouille", type: ["French"], rating: 4.7, delivery: false)
print(laRatatouille.name)
print(laRatatouille.type)
print(laRatatouille.rating)
print(laRatatouille.delivery)


// Inheritance
// When defining a class, it can inherit another classes properties and methods
// This is where classes differ from structures
// Inherting class is a SUBCLASS
// class it inherits from is a SUPERCLASS
class BankAccount {
    var balance = 0.0
    func deposit(amount: Double) {
        balance += amount
    }
    func withdraw(amount: Double) {
        balance -= amount
    }
}
class SavingsAccount: BankAccount {  // <- Inheritance 
    var interest = 0.0
    func addInterest() {
        let interest = balance * 0.005
        self.deposit(amount: interest)
    }
}


// Overriding Methods
// redeclare it in the subclass with the override keyword
class BankAccount {
    var balance = 0.0
    func deposit(amount: Double) {
        balance += amount
    }
    func withdraw(amount: Double) {
        balance -= amount
    }
}
class SavingsAccount: BankAccount {  // <- Inheritance 
    var interest = 0.0
    var numWithdraw = 0
    func addInterest() {
        let interest = balance * 0.005
        self.deposit(amount: interest)
    }
    override func withdraw(amount: Double) {
        balance -= amount
        numWithdraw += 1 // runs the function so a tally is added
    }
}
//
class Order {
  var items = [""]
  var subtotal = 0.0
  var tip = 0.0
  var total = 0.0

  func printReceipt() {
    print("Items:     \(items)")
    print("Subtotal:  $\(subtotal)")
    print("Tip:       $\(tip)")
    print("Total:     $\(total)")
  }
}
class DeliveryOrder: Order {
  var deliveryFee = 2.0
  override func printReceipt() {
    print("Items:     \(items)")
    print("Subtotal:  $\(subtotal)")
    print("Tip:       $\(tip)")
    print("Delivery:  $\(deliveryFee)") // added the delivery fee
    print("Total:     $\(total)")
  }
}
var order2 = DeliveryOrder()
order2.items = ["Ramen", "Diet Coke"]
order2.subtotal = 14.69
order2.tip = 2.00
order2.deliveryFee = 3.00
order2.total = 19.69

order2.printReceipt()


// Classes are Reference Types
// another distinction between structs and class
// struct = value, class = reference 
// unlike values, reference types are not copied when they are assigned to a var or let(contant) 
// or when they are passed to a function
class Order {
  var items = [""]
  var subtotal = 0.0
  var tip = 0.0
  var total = 0.0
  
  init(items: [String], subtotal: Double, tip: Double, total: Double) {
    self.items = items
    self.subtotal = subtotal
    self.tip = tip
    self.total = total
  }
}
var order1 = Order(items: ["Chili Fries", "Lemonade"], subtotal: 8.75, tip: 2.0, total: 12.75)
var order8 = order1
order8.total = 0.0
print(order1.total)
print(order8.total)



// REVIEW
// A class is another means of modeling real-life objects programmatically.
// How to create a class using the class keyword.
// Using the init() method allows us to provide an instance with specific values right off-the-bat during the creation of an instance.
// A class can inherit another class’s properties and methods.
// When using inheritance, the subclass can use the override keyword to redeclare a method with the same name.
// Classes are reference types, any copied class that has its properties altered will affect the original class from which it was copied.


// POKEDEX
// Add more properties to the Pokemon class
// Add more methods to the Pokemon class

class Pokemon {
  var num = 0
  var name = ""
  var type = [""]
  var ability = [""]

  init(num: Int, name: String, type: [String], ability: [String]) {
    self.num = num
    self.name = name
    self.type = type
    self.ability = ability
  }

func displayInfo() {
  print("Pokemon Information:")
  print("Number:    \(num)")
  print("Name:      \(name)")
  print("Type:      \(type)")
  print("Ability:   \(ability)")
  print("************************")
}

}


class GigantamaxPokemon: Pokemon {
  var location = ""
      //the new init() need to include the Superclasses init arams as well, but in supr.init() form
  init(num: Int, name: String, type: [String], ability: [String], location: String) {
    self.location = location
    super.init(num: num, name: name, type: type, ability: ability)
  }
  override func displayInfo() {
  print("Pokemon Information:")
  print("Number:    \(num)")
  print("Name:      \(name)")
  print("Type:      \(type)")
  print("Ability:   \(ability)")
  print("Location:  \(location)")
  print("************************")
}
}

var charizard = GigantamaxPokemon(num: 6, name: "Charizard", type: ["Fire 🔥"], ability: ["Blaze"], location: "Lake of Outrage")
var bulbasaur = Pokemon(num: 1, name: "Bulbasaur", type: ["Grass 🌱", "Poison 💀"], ability: ["Overgrow"])
var charmander: Pokemon = Pokemon(num: 4, name: "Charmander", type: ["Fire 🔥"], ability: ["Blaze"])
var squirtle: Pokemon = Pokemon(num: 7, name: "Squirtle", type: ["Water 💧"], ability: ["Torrent"])

bulbasaur.displayInfo()
charmander.displayInfo()
squirtle.displayInfo()
charizard.displayInfo()