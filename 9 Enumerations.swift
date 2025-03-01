
//***
// Enumerations - enum 
// A data type 
// Swift extends their functionality offing capabilites only found in classes. 

enum MyDataType {
  // entire enum definition lives here
}

enum DogBreed {
    case corgi
    case husky
    case shiba
}
// or
enum DogBreed {
    case corgi, husky, shiba
}


// Updating an instance of an enum
//
enum DogBreed {
    case corgi, husky, shiba
}
var bella = DogBreed.husky
bella = .corgi // no need to define DogBreed as the compiler knows and bella is from

print("Hello \(bella)")


// Enums in a Swift Control Flow
// switch statements are common places for an enum
// No need for a default at the end of the 'switch'/case either. 
enum Pet {
    case ruth, meepa, rusty
}
let myPet = Pet.meepa
switch myPet {
    case .ruth:
        print("I am the night do not percieve")
    case .meepa:
        print("I am anger do not touch")
    case .rusty:
        print("I was good boy")
}


// iterating over Enum cases
// utilize a protocol
// protocols define a set of methods and properties that can be adopted by an enum
// : CaseInterable protocol gives us access to the property allCases that returns an array of case values
enum Season: CaseIterable {
    case winter
    case spring
    case summer
    case fall
}
for season in Season.allCases {
    print(season)
}


// Defining raw values for enum cases
// 
enum Team: Int {
    case alpha = 1 // defines the raw value for each following case as well
    case bravo
    case charlie
    case delta
}
let team = Team.bravo
print(team.rawValue) // Prints: 2
print(Team.delta.rawValue) //Prints: 4

enum Status: String {
    case complete // if no raw value for string defined, defaults to case name
    case pending
    case rejected
}
let myStatus = Status.complete
print(myStatus.rawValue) // Prints: complete


// Using Associated values with enums
// ability to store an associated value of any type attached to a case value
// different then raw values as each case can have a different type of associated value or none
enum Dessert {
    case cake(flavor: String) // defining an associated value
    case pie(slices: Int)
    case brownie
}
let tonightsSpecial = Dessert.pie(slices: 2)
let tomorrowsSpecial = Dessert.brownie
switch tonightsSpecial {
    case let .cake(cakeFlavor):
        print("Time for \(cakeFlavor) cake!")
    case let .pie(sliceCount):
        print("\(sliceCount) slices of pie!")
    case .brownie:
        print("Decadent goodness.")
}
switch tomorrowsSpecial {
    case let .cake(cakeFlavor):
        print("Time for \(cakeFlavor) cake!")
    case let .pie(sliceCount):
        print("\(sliceCount) slices of pie!")
    case .brownie:
        print("Decadent goodness.")
}

enum Vehicle {
    case truck(isFourWheelDrive: Bool)
    case boat
    case airplane
}
 
let myRide = Vehicle.truck(isFourWheelDrive: true)
switch myRide {
case let .truck(isFourWheelDrive): 
    if isFourWheelDrive {
        print("Let's go to the mountains")
    } else {
        print("Let's go to the store")
    }
case .boat:
    print("Let's sail to Hawaii")
case .airplane:
    print("Let's fly to Peru")
}


// Implementing Methods in Enumerations
// can define an instance method inside of an enum
// mutating method within an enum, mutating method changes the values of its intance when executed
enum Season {
    case winter, spring, summer, fall

    mutating func changeSeason() {
        switch self {
            case .winter:
                self = .spring
            case .spring:
                self = .summer
            case .summer:
                self = .fall
            case .fall:
                self = .winter
        }
    }
}
var currentSeason = Season.fall // declares the season to be fall
currentSeason.changeSeason() // calls the change season func to the case of fall -> winter
print(currentSeason)

enum Vehicle {
    case truck(isFourWheelDrive: Bool)
    case boat
    case airplane
    
    // mutating instance method here
    mutating func goOffRoad() {
      self = .truck(isFourWheelDrive: true)
    }
}
var myRide = Vehicle.airplane
myRide.goOffRoad()
print(myRide)


// Implementing a Computed Property in an Enumeration
// computed property is a property that isn't directly stored 
// but is instead derived from other stored properties of the enum
// can return any type of value and doesn't need to be the same as the rawValue
enum Patty: Int {
    case single
    case double
    case triple
    var pattyCountWithExtraPatty: Int {  // computed variable property
        return self.rawValue + 1
    }
}
let burger = Patty.triple.pattyCountWithExtraPatty
print(burger)

enum Vehicle {
    case airplane
    case boat
    case truck(isFourWheelDrive: Bool)
    var description: String {
        switch self {
        case .airplane:
            return "This is an airplane"
        case .boat:
            return "This is a boat"
        case let .truck(isFourWheelDrive):
            return "This is a truck" + (isFourWheelDrive ? " with four wheel drive" : "")
        }
    }
}
let myRide = Vehicle.truck(isFourWheelDrive: true)
print(myRide.description)


// REVIEW 
// What an enumeration is
// How to use enumerations in a switch control flow
// How to iterate over enumerations cases like a collection
// Defining raw values in an enumeration
// Explicitly and implicitly assigning raw values
// Extracting raw values for cases
// Initializing an instance with a raw value
// All cases must have the same type of raw value
// Defining associated values in an enumeration
// Associated values can be differently typed for each case
// All cases don’t need associated value
// Implementing methods in enumerations
// Use of mutating methods
// Defining computed properties in enumerations
// Enumerations are indeed first class citizens in Swift and can help you write clean, expressive code


// Numero Uno Software Store
// 
enum DeliveryMethod {
    case cloudDigital(isLifetime: Bool)
    case shipping(weight: Int)

    var shippingCost: Int {
        switch self {
            case .shipping(let weight): 
                return weight * 2
            case .cloudDigital:
                return 0
        }
    }
}
enum Edition: String {
    case basic 
    case premium
    case ultimate

    mutating func upgrade() {
        switch self {
            case .basic:
            self = .premium 
            case .premium:
            self = .ultimate
            case .ultimate:
            print("Can't upgrade further")
        }
    }
}
enum ProductType: String, CaseIterable {
    case aceRepository = "Ace Repository"
    case dealForcer = "Deal Forcer"
    case kadencePlanner = "Kadence Planner"
    case mailCannon = "Mail Cannon"
}

func displayProductOfferings() {
    print("There are \(ProductType.allCases.count) products")
    for product in ProductType.allCases {
            print(product.rawValue)
    }
}

func sendOrderConfirmation(of productType: ProductType, in edition: Edition, by deliveryMethod: DeliveryMethod) {
    print("Thank you for purchasing the \(edition.rawValue) edition of \(productType.rawValue)")
    switch deliveryMethod {
        case .shipping:
            print("Your order will be shipped to you at a cost of $\(deliveryMethod.shippingCost)")
        case .cloudDigital(let isLifetime):
            if isLifetime {
                print("You have lifetime cloud access")
            } else {
                print("You can access you subscription information on the cloud")
            }
    }
}

displayProductOfferings()
var myEdition = Edition.basic
myEdition.upgrade()
sendOrderConfirmation(of: ProductType.aceRepository, in: myEdition, by: DeliveryMethod.shipping(weight: 1))