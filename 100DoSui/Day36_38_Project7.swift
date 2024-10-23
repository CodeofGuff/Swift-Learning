// Project 7

// how to show another screen, 
// how to share data across screens,
// how to load and save user data, and more 



// if we want two or more views to share the same data, use a class
// if each instance needs to be different or unique, use a struct

// @Observable watches classes for changes and refreshes any views that are affected.
// sheet() watches a condition we specify and shows or hides a view automatically.
// Codable can convert Swift objects into JSON and back with almost no code from us.
// UserDefaults can read and write data so that we can save settings and more instantly.


// @Observable on top of a class makes it like a struct... the view is observing the changes made / updates them automatically
// If you use @State with a struct, your SwiftUI view will update automatically when a value changes, 
// but if you use @State with a class then you must mark that class with @Observable if you want SwiftUI
//  to watch its contents for changes.

// showing and hiding views
// Sheet - Define conditions which the sheet should be shown.font(.system(size: 8.0,weight: .black, design: .default))


// User Defaults:
// Storing app stat data for the user with @AppStorage

// : Codeable 
// Codable: a protocol specifically for archiving and unarchiving data, 
// which is a fancy way of saying “converting objects into plain text and back again.”






// Code for the learning so Far: Copy Paste in xCode to tinker!!
import Observation
import SwiftUI

@Observable // tells SwuiftUI to look inside the view and reload the view when it changes
class User {
	var firstName = "David"
	var lastName = "Guffre"
}

struct User2: Codable {
	let firstName: String
	let lastName: String
	
}

struct ThirdView: View {
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@Environment(\.dismiss) var dismiss
	
	@State private var user = User2(firstName: "Taylor", lastName: "Swift")

	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			VStack {
				Button("Save User") {
					let encoder = JSONEncoder()
					
					if let data = try? encoder.encode(user) {
						UserDefaults.standard.set(data, forKey: "User Data")
					}
				}
				
				Button("Dismiss") {
					dismiss()
				}
			}
		}
	}
}

struct SecondView: View {
	@Environment(\.dismiss) var dismiss
	let name: String
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@State private var numbers = [Int]()
	@State private var currentNumber = 1
	
	@AppStorage("tapCount") private var tapCount = 0
	
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			NavigationStack {
				VStack {
					Text("Hello \(name)")
					Text("You have \(numbers.count) rows!")
					Text("You have made rows \(tapCount) times!")
					
					// on delete does not work on a ForEach.. have to wrap in a List
					List {
						ForEach(numbers, id: \.self) {
							Text("Row \($0)")
						}
						.onDelete(perform: removeRows)
					}
					
					Button("Add Number") {
						numbers.append(currentNumber)
						currentNumber += 1
						tapCount += 1
						
					}
					Button("Dismiss") {
	
						dismiss()
					}
				}
				.toolbar {
					EditButton()
			}
			
			}
		}
	}
	func removeRows(at offsets: IndexSet) {
		numbers.remove(atOffsets: offsets)
	}
}


struct ContentView: View {
	@State private var animationAmount: Double = 0.0
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	
	@State private var user = User()
	@State private var showingSheet = false
	@State private var showingSheet2 = false

	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			
			VStack {
				Button(action: {
					withAnimation {
						animationAmount += 360
					}
				}) {
					Image(systemName: "macpro.gen1.fill")
						.resizable()
						.frame(width: 50, height: 50)
						.foregroundStyle(.red)
						.rotationEffect(.degrees(animationAmount))
				}
				
				Text("Hello \(user.firstName)")
					.font(.largeTitle)
					.bold()
					.foregroundStyle(.yellow)
				
				
				Button("Show Row Maker!") {
					showingSheet.toggle()
				}
				.sheet(isPresented: $showingSheet) {
					SecondView(name: "Rows Maker")
				}
				
				Button("Show the third view") {
					showingSheet2.toggle()
				}
				.sheet(isPresented: $showingSheet2) {
					ThirdView()
				}
				
				TextField("First name", text: $user.firstName)
				TextField("Last name", text: $user.lastName)
				
		
			}
			
		}
		
		
		
	}
}

#Preview {
	ContentView()
}
