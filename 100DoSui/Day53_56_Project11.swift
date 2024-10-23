// Day 53 - 56 

//BookWorm project

// SwiftData! @Binding
// Data is the keyyy


// @Binding lets us store a single mutable value in a view that actually points to some other value from elsewhere.

// It can also now query them, delete them, link them with other objects, and more.
 // This class is called a SwiftData model: it defines some kind of data we want to work with in our apps. 
 // Behind the scenes, @Model builds on top of the same observation system that @Observable uses, 
 // which means it works really well with SwiftUI.

 // full App Code in xCode repo BookWorm(sUI)
// Challnges:
//  Right now it’s possible to select no title, author, or genre for books, which causes a problem for the detail view. Please fix this, either by forcing defaults, validating the form, or showing a default picture for unknown genres – you can choose.
//  Modify ContentView so that books rated as 1 star are highlighted somehow, such as having their name shown in red.
//	Add a new “date” attribute to the Book class, assigning Date.now to it so it gets the current date and time, then format that nicely somewhere in DetailView.



//@Binding and Button Toggle
import SwiftUI
struct PushButton: View {
	let title: String
    // binds rememberMe 
	@Binding var isOn: Bool
	
	var onColors = [Color.red, Color.yellow]
	var offColors = [Color(white: 0.6), Color(white: 0.4)]
	
	var body: some View {
		Button(title) {
			isOn.toggle()
		}
		.padding()
		.background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
		.foregroundStyle(.white)
		.clipShape(.capsule)
		.shadow(radius: isOn ? 0 : 5)
	}
}
struct ContentView: View {
	@State private var rememberMe = false
	
	var body: some View {
		VStack {
			PushButton(title: "Remember Me", isOn: $rememberMe) // $rememberMe is bound
			Text(rememberMe ? "On" : "Off")
		}
	}
}
#Preview {
	ContentView()
}


// TextEditor, (TextField)
import SwiftUI
struct ContentView: View {
	// do not use AppStore for private info
	@AppStorage("notes") private var notes = ""
	var body: some View {
		NavigationStack {
			TextField("Enter your Text", text: $notes, axis: .vertical)
				.textFieldStyle(.roundedBorder)
				.navigationTitle("Notes")
				.padding()
		}
	}
}
#Preview {
	ContentView()
}






