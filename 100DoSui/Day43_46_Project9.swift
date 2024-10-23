// Day 43 - 46 

// "find your why and you'll find your way."

// Project 9 

// Focus on Navigation
// pretty much the core of many apps I will build
// user navigation and programmatic navigation

// sheets vs navigation

/// GO BACK AND DO CHALLENGES FOR PROJECT 7 AND 8 
// Change project 7 (iExpense) so that it uses NavigationLink for adding new expenses rather than a sheet. (Tip: The dismiss() code works great here, but you might want to add the navigationBarBackButtonHidden() modifier so they have to explicitly choose Cancel.)
// Try changing project 7 so that it lets users edit their issue name in the navigation title rather than a separate textfield. Which option do you prefer?
// Return to project 8 (Moonshot), and upgrade it to use NavigationLink(value:). This means adding Hashable conformance, and thinking carefully how to use navigationDestination().






// example code
import SwiftUI
struct ContentView: View {
	@State private var path = [Int]()
	
	var body: some View {
		NavigationStack(path: $path) {
			VStack {
				Button("This is the number 2") {
					path = [2]
				}
				Button("The number 9, and 10") {
					path = [9, 10] // goes to the end of the array first
				}
			}
			.navigationDestination(for: Int.self) { selection in
					Text("#: \(selection)")
			}

		}
	}
}
#Preview {
	ContentView()
}

import SwiftUI
struct ContentView: View {
	@State private var path = NavigationPath()
	
	var body: some View {
		NavigationStack(path: $path) {
			List {
				ForEach(0..<5) { i in
					NavigationLink("Select Number: \(i)", value: i)
				}
				
				ForEach(0..<5) { i in
					NavigationLink("Select String: \(i)", value: String(i))
				}
			}
			.toolbar {
				Button("Push 556") {
					path.append(556)
				}
				Button("Push Hello") {
					path.append("Hello")
				}
			}
			.navigationDestination(for: Int.self) { selection in
				Text("You selected the number \(selection)")
			}
			.navigationDestination(for: String.self) { selection in
				Text("You selected the string \(selection)")
			}
		}
	}
}
#Preview {
	ContentView()
}




import SwiftUI
struct DetailView: View {
	var number: Int
	@Binding var path: NavigationPath
	
	var body: some View {
		NavigationLink("Go to random number", value: Int.random(in: 1...1000))
			.navigationTitle("Number: \(number)")
			.toolbar {
				Button("Home") {
					path = NavigationPath()
				}
			}
	}
}
struct ContentView: View {
	@State private var path = NavigationPath()
	
	var body: some View {
		NavigationStack(path: $path) {
			DetailView(number: 0, path: $path)
				.navigationDestination(for: Int.self) { i in
					DetailView(number: i, path: $path)
				}
		}
	}
}
#Preview {
	ContentView()
}


import SwiftUI
@Observable
class PathStore {
	var path: NavigationPath {
		didSet {
			save()
		}
	}
	
	private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
	
	init() {
		if let data = try? Data(contentsOf: savePath) {
			if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
				path = NavigationPath(decoded)
				return
			}
		}
		
		path = NavigationPath()
 	}
	
	func save() {
		
		guard let representation = path.codable else { return }
		
		do {
			let data = try? JSONEncoder().encode(representation)
			try data?.write(to: savePath)
		} catch {
			print("Failed to save nav data")
		}
	}
}
struct DetailView: View {
	var number: Int
	@Binding var path: NavigationPath
	
	var body: some View {
		NavigationLink("Go to random number", value: Int.random(in: 1...1000))
			.navigationTitle("Number: \(number)")
			.toolbar {
				Button("Home") {
					path = NavigationPath()
				}
			}
	}
}
struct ContentView: View {
	@State private var pathStore = PathStore()
	
	var body: some View {
		NavigationStack(path: $pathStore.path) {
			DetailView(number: 0, path: $pathStore.path)
				.navigationDestination(for: Int.self) { i in
					DetailView(number: i, path: $pathStore.path)
				}
		}
	}
}
#Preview {
	ContentView()
}

import SwiftUI

struct ContentView: View {
	
	var body: some View {
		
		NavigationStack {
			List(0..<100) { i in
				Text("Row \(i)")
			}
			.navigationTitle("Title goes here")
			.navigationBarTitleDisplayMode(.inline)
			.toolbarBackground(.gray)
			.toolbarColorScheme(.dark)
			.toolbar(.hidden, for: .navigationBar)
		}
	}
}


#Preview {
	ContentView()
}


NavigationStack {
	Text("Hi there!")
		.toolbar {
			ToolbarItemGroup(placement: .confirmationAction) {
				Button("Tap Me") {
				//
				}
				Button("Or Tap Me") {
			//
			}
		}
	}
}
// or
NavigationStack {
	Text("Hi there!")
		.toolbar {
			ToolbarItem(placement: .topBarLeading) {
				Button("Tap Me") {
					//
				}
			}
			ToolbarItem(placement: .topBarLeading) {
				Button("Or Tap Me") {
					//
				}
			}
		}
}


import SwiftUI
struct ContentView: View {
	@State private var title = "SwiftUI"
	
	var body: some View {
		
	
		NavigationStack {
			Text("Hello, world!")
				.navigationTitle($title)
				.navigationBarTitleDisplayMode(.inline)
		}
	}
}
#Preview {
	ContentView()
}
