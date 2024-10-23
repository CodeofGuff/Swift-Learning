// iOS Dev 
// codeCademyCourse


// - Use Swift and SwiftUI to build iOS applications
// - Build a wireframe for a project
// - Use the MVVM design pattern to architect your applications
// - Use the command line
// - Manage versions of your code with Git
// - Collaborate with teammates on GitHub
// - Use lists and forms to add interactivity
// - Save and load data locally to your phone
// - Use external APIs to fetch data
// - Store and retrieve information from Firebase
// - Authenticate users
// - Publish an app to the App Store
// - Use data structures and algorithms to answer interview questions





// WIreframing 
//  - A wireframe is a collection of sketches and notes that depict a website as it would look on a browser, a tablet, or a mobile device. It shows the layout of the app’s elements, like navigation bars, buttons, content placement, and more—it’s like the blueprint to our app


// Step 1 - Screens
//  - Self contained user interface devoted to a particular purpose in the app. 
//  - IE: amazon, shopping cart and past orders are on separate, screens. 
//  - Differentiate between screens
//  - Home Screen, Search Screen, Product Details, Cart Screen

// Step 2 - Flow
//  - Path that a user takes through software
//  - Predicts which screens a user will need when clicking something. 
//  - Account, Account details, Settings, FAQ, etc

// Step 3 - Wireframes
//  - Sketches of our apps’ screens in rough approximation to how they will appear in the final product. (iPhone, iPad, watch, etc) and appropriate ratios
//  - Lose in appearance, but precise in concepts and design. 
//  - A circle can represent a user’s avatar.
//  - A box acts as a placeholder for an image, icon, or button.
//  - A rectangle can stand for a text area featuring pertinent information.

// Revise the wireframe 24 hours after first iteration 
// Practice wireframing by drawing out screens and the different UIs you want to display. 


// Creating a new Project in Xcode: - WHAT IS APP PLAYGROUND?
// * App: This is the option to choose for most standard apps. It creates a project with a single user interface or view.
// * Document App: Choose this option if you expect your app to create documents and share them with other apps. Examples of such apps are text editors and spreadsheets that incorporate a file browser.
// * Game: Choose this option if you want to create a gaming app that requires complex graphics. Even though we’re building a game in this skill path, our app doesn’t require advanced graphics features to be able to run, so we won’t choose this option.
// * Augmented Reality App: Select this option to create an augmented reality app.
// * Sticker Pack App: Choose this option to create a project for stickers to be used in the iMessage app. Note that sticker packs are extensions and not apps and can only be used with iMessage.
// * iMessage App: This option is used for projects that allow you to create extensions for iMessage or standalone iMessage apps.

// * You can also choose to create a framework or library that can be used by different apps. With Xcode, you can create a framework, a static library or a Metal library.


// Organization Identifier = guffcode


// SwiftUI:
// Views: 
//  - The building blocks for the UI of the app.
//  - A Scene in an app is made up of Views such as: Text, Image, Label, Button
//  - A Protocol: Defines a blueprint of a set of requirements that are needed to accomplish a task


// MVVM - Model-View-ViewModel - Architectural pattern to organize code in a clean and maintainable way
// * Model: Represents data and business logic of the application. 
//         In iOS a class or struct. Data management using Core Data, Networkking code. 
// * View: User Interface (UI) of the application. 
//         In iOS this includes the UIView, and UIViewController subclases, and any layout code. 
//         View displays the data of ViewModel
// * VIewmodel: Hold the data that the view will display and provides methods to interact with the Model. 
//         Uses #Published properties to auto notify View when the data changes. 


// DRY - Don't Repeat Yourself
//  - Adding the Text view styling to a SwiftUI View/File

// SwiftUI:
// Views: 
//  - The building blocks for the UI of the app.
//  - A Scene in an app is made up of Views such as: Text, Image, Label, Button
//  - A Protocol: Defines a blueprint of a set of requirements that are needed to accomplish a task
//  - Views are structures or structs. Structures encapsulate a set of related properties and functions. 
//  - .multilineTextAlignment() sets the alignment of text spread across multiple lines.  
//  - .padding() adds space around the view. You can customize that behavior by specifying the sides on which you want the padding to be applied using EdgeInsets
//     - .padding(EdgeInsets(top: 3, leading: 5, bottom: 10, trailing: 20))
//     - or .padding(.top, 10)

struct HappyView: View {
   var body: some View {
       Text("Hello, World!").multilineTextAlignment(.center)
        .padding(.top 3)
        .border(width: 1)
        
   }
}

//  VStack: 
//   - A VStack acts as a wrapper around constituent views and arranges them in a vertical line.
//   - For example, if you want two Text views to be arranged vertically on the screen, you’d use a VStack.
//   - View modifiers that affect the VStack exclusively include:
//     - padding(): Used to provide spacing between the VStack and any adjacent views.
//     - border(): Used to draw a rectangular border around the VStack.
//   - View modifiers that affect the child views of VStack include:
//     - .font() - If the Text views have different font() modifiers applied to them, then those modifiers would take precedence.
//     - .forgroundStyle(Color.blue) - changes text color 
//   - You can change the alignment and spacing of the child views by defining them when you declare the VStack

VStack {
  Text("Learning to code!")
  Text("I'm happy")
}

VStack {
    Text("Learning to code!")
        .font(Font.custom("Helvetica", size: 16))
    Text("I'm happy")
}
.font(.title)
.forgroundStyle(Color.blue)

VStack(alignment: .leading, spacing: 10) {
    Text("Learning to code!")
    Text("I'm happy")
}



// HStack: 
//   - An HStack is very similar to a VStack, except it arranges its child views in a horizontal line instead of a vertical line.
//   - The alignment options include .top, .bottom, .center, .firstTextBaseline and .lastTextBaseline.

HStack {
    Text("Learning to code!")
        .font(Font.custom("Helvetica", size: 24))
    Text("I'm happy")
}

HStack(alignment: .top, spacing: 10) {
    Text("Learning to code!")
        .foregroundColor(.white)
        .font(Font.custom("Helvetica", size: 20))
        .padding(10)
        .background(Color.blue)
    Text("I'm happy")
        .font(Font.custom("Helvetica", size: 12))
        .padding(20)
        .background(Color.gray)
}


// ZStack: 
//  - A ZStack is used to layer views on top of one another. 
//  - It is useful when you want to create overlapping views and define which view should be shown on top of the other. 

ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
    VStack {}
        .frame(width: 300, height: 300)
        .background(Color.black)
    VStack {}
        .frame(width: 200, height: 200)
        .background(Color.blue)
    VStack {}
        .frame(width: 100, height: 100)
        .background(Color.gray)
        Text("HI!!")
}



// Button: 
//  - Button views in SwiftUI conform to the View protocol. 
//  - A special kind of View that we can use to perform an action. 


Button(action: {
    // some action here
    }, label: {
    // some View here
})

Button(action: {
    print("boop")
    }, label: {
    Text("Click Me")
    })
    .foregroundStyle(.white)
    .font(Font.custom("Helvetica", size: 20))
    .padding(10)
    .background(Color.blue)


// Spacer:
//  - A type of View that is designed to take up as much space as it can, horizontally or vertically, depending on the container it is put into. 

 HStack {
    Spacer()
        .frame(width: 200)
    Text("I'm blue!")
        .font(.title)
        .foregroundColor(.blue)
        }



// ForEach:
// struct that loops through a collection of data and create a corresponding view for each element. 

// i.e in an HStack
HStack {
    ForEach(0..<question.possibleAnswers.count) { answerIndex in
    Button(action: {
        print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
        mainColor = answerIndex == question.correctAnswerIndex ? .green : .red
        }) {
        ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
    }
}
}


// the @State property wrapper allows us to to tell SwiftUI that one of the properties of
// of the View can change. 
// "This var can change, update the screen if it does"



// MVVM Architecture
// Model
// The Model is the core data and logic of our software. This is where we define how our data is structured, manipulated, and stored. 
// We will be creating two Models in our application, a Question Model and a Game Model. 
// These two structures contain the data and logic that make our game work the way we intend.

// View
// The View is the user interface of the application; this is what you will see on your screen. 
// It handles the presentation of data and user input such as tapping on a button.

// ViewModel
// The ViewModel is our in-between structure. 
// It is designed to expose only the data points and hold the presentation logic that a specific View needs. 
// The ViewModel exposes information from the Model to the View and then updates the Model in response to user interaction. 
// The beauty of the ViewModel is that the Models and Views never interact with each other directly. 
// This allows us to not have to build a different Model based on what the View needs and vice-versa. 
// The Model doesn’t care about the View, and the View isn’t aware of the Model. 
// Most times, the View will not need all the data that is stored in a Model, 
// so the ViewModel only gives the UI access to information that it needs to present to the user. 
// The ViewModel can pull data from one Model, or in our case, combine two or more Models under the same ViewModel.