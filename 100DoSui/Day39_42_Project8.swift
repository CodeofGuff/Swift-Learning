// day 39 - 42



// Project 8

// dont forget that data defines what your app can do
// Generics let us create hioghly reusable code - 
// Generics allow us to write code that is capable of working with a variety of different types.
// How to make an image fit the screen corectly and other SwuiftUI Porblems
// Codable, List, Text + More


// LazyHStack and LazyVStack  load their contct on demand, as oppose to all at once with 
// a regular V or H stack
// Lazys will expand to fill avilable space as needed

// NavigationStack shows a navigation bar at the top of our views, but also does something else: 
// it lets us push views onto a view stack. 
// In fact, this is really the most fundamental form of iOS navigation 


// NavigationLink IE:
NavigationStack {
	//NavigationLink allows each row to be a 'button' and access whast inside of it.
	List(0..<100) { row in
		NavigationLink("Row \(row)") {
			Text("Detail \(row)")
		}
	}
	.navigationTitle("SwiftUI")

}

// using Codable to decode JSON
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}
Button("Decode JSON") {
	let input = """
	{
		"name": "Taylor Swift",
		"address": {
			"street": "555 T Swift Ave",
			"city": "Nashville"
		}
	}
	"""
			
	let data = Data(input.utf8)
	let decoder = JSONDecoder()
	if let user = try? decoder.decode(User.self, from: data) {
		print(user.address.street)
	}
}

// Grids!
struct ContentView: View {
	let layout = [
		GridItem(.adaptive(minimum: 80, maximum: 120)),
	]
	
	var body: some View {
        // Remove .horizontal, LazyH to LazyV, and rows to columns for Vertical!
		ScrollView(.horizontal) {
			LazyHGrid(rows: layout) {
				ForEach(0..<1000) {
					Text("Item \($0)")
				}
			}
		}
		
		
	}
}



// Code so far with Learning: 
import SwiftUI

struct CustomText: View {
	let text: String
	var body: some View {
		Text(text)
	}
	init(text: String) {
		print("Creating new CustomText")
		self.text = text
	}
}
struct ContentView: View {
	@State private var animationAmount = 0.0
	@State private var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@State private var showingSheet = false
	
	var body: some View {
		
		ZStack {
			mainColor.ignoresSafeArea()
			
			VStack {
				Image(.example) //access images without using a String Identify
					.resizable()
					.scaledToFit()
				// frame relative to its conatiner size (in this case the hwole screen width)
				// just horizontal sizing, relative to the container enivro
				// axis is always horizontal
					.containerRelativeFrame(.horizontal) { size, axis in
						size * 0.8
					}
				
				Button(action: {
					withAnimation {
						animationAmount += 360
						showingSheet.toggle()
					}
				}) {
					Image(systemName: "macpro.gen1.fill")
						.resizable()
						.frame(width: 50, height: 50)
						.foregroundStyle(.red)
						.rotationEffect(.degrees(animationAmount))
				}
				.sheet(isPresented: $showingSheet) {
					SecondView()
				}
				Text("Hello David")
					.font(.largeTitle)
					.bold()
					.foregroundStyle(.yellow)
			}
			
		}
		ZStack {

			ScrollView(.horizontal) { // take out .horizontal and make V Stack to shange direction
				// Lazy stacks load their content when it is viewed, not when the page is loaded
				LazyHStack(spacing: 10) {
					ForEach(1..<51) {
						CustomText(text: "Item \($0)")
							.font(.title)
					}
				}
			}
		}
	}
}

struct SecondView: View {
	@State private var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@Environment(\.dismiss) var dismiss
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			Text("Error: ----->       immediately")
			Button("exit") {
				dismiss()
			}
		}
	}
}

#Preview {
	ContentView()
}
