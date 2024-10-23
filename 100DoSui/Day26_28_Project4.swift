// Day 26 - 28 

// Project 4 
// BetterRest

// Machine Learning
// All iPhone have CoreML built in
// It allows us to write code that makes predictions about new data based on previous data it has seen
// using a technique called regression analysis we can ask the computer to come up with an algorithm able to represent all our data



// Stepper: a simple - and + button that can be tapped to select a precise number
@State private var sleepAmount = 8.0

// Between 4 and 12 hours, by .25hrs at a time
//.formated() removes the excess .00000s
Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    .background(.white)


// DatePicker: a date picker!
// Date.now all future dates allowed but not PAST dates
// .labelsHidden() conceals the Text, and fomats the date
DatePicker("Please enter date", selection: $wakeUp, in: Date.now...)
    .background(.white)
    .labelsHidden()
                


func exampleDates() {
    let now = Date.now
    let tomorrow = Date.now.addingTimeInterval(86400) //seconds in a day        
    let range = now...tomorrow
    }

func exampleDates() {
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? .now
    // .date return method returns an Optional date
    // nil coelesent to make sure something is returned
    }

// Better way to write the above? 
func exampleDates() {
    let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    }


// CoreML and CreateML

// CoreML lets us make apps using machine learning, 
// CreateML lets us create custom machine learning models of our own using a dedicated Create ML app 
// that makes the whole process drag and drop

// Tabular Regression
// can throw info at CreateML and ask it to figure out the relationship between them all, to make predictions
