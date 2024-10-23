// Day 49 - 52
// Project 10 
// Cupcake Corner


// Learnig Code: 
// Using URLSession
import SwiftUI
struct Response: Codable {
	var results: [Result]
	
}
struct Result: Codable {
	var trackId: Int
	var trackName: String
	var collectionName: String
}

struct ContentView: View {
	@State private var results = [Result]()
	
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			List(results, id:\.trackId) { item in
				VStack(alignment: .leading) {
					Text(item.trackName)
						.font(.headline)
					
					Text(item.collectionName)
				}
			}
			.task {
				await loadData()
			}	
		}
	}
	
	func loadData() async {
		guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
			print("Invalid URL")
			return
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			if let decodedRespose = try? JSONDecoder().decode(Response.self, from: data) {
				results = decodedRespose.results
			}
		} catch {
			print("Invalid Data")
		}
	}
	
}
#Preview {
	ContentView()
}


// Image loading
// Code: 
import SwiftUI
struct ContentView: View {
	
	var body: some View {
		AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
			
			if let image = phase.image {
				image
					.resizable()
					.scaledToFit()
			} else if phase.error != nil {
				Text("Error loading Image")
			} else {
				ProgressView()
			}
		}
			.frame(width: 200, height: 200)
	}
}
#Preview {
	ContentView()
}



// Validating Form entries
import SwiftUI
struct ContentView: View {
	@State private var username = ""
	@State private var email = ""
	
	var disableForm: Bool {
		username.count < 5 || email.count < 5
	}
	
	var body: some View {
		Form {
			Section {
				TextField("Username", text: $username)
				TextField("Email", text: $email)
				
			}
			
			Section {
				Button("Create account") {
					print("Creating account...")
				}
			}
			.disabled(disableForm)
		}
	}
}

#Preview {
	ContentView()
}


// Adding Codable conformance to an @Observable class
// 
import SwiftUI

@Observable
class User: Codable {
	enum CodingKeys: String, CodingKey {
		case _name = "name"
	}
	var name = "Taylor"
	
}

struct ContentView: View {

	var body: some View {
		Button("Encode Taylor", action: encodeTaylor)
		
	}

	func encodeTaylor() {
		let data = try! JSONEncoder().encode(User())
		let str = String(decoding: data, as: UTF8.self)
		print(str)
	}

}
#Preview {
	ContentView()
}


// Haptic Effects 
// Quick haptic format:
struct ContentView: View {
	@State private var counter = 0
	var body: some View {
		Button("Tap Count: \(counter)") {
			counter += 1
		}
		.sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
	}
}

// Advanced Haptic Control
import SwiftUI
import CoreHaptics
struct ContentView: View {
	@State private var counter = 0
	@State private var engine: CHHapticEngine?
	var body: some View {
		
		Button("Play Haptic", action: complexSuccess)
			.onAppear(perform: prepareHaptics)
	}
	
	func prepareHaptics() {
		guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
		
		do {
			engine = try CHHapticEngine()
			try engine?.start()
		} catch {
			print("Error starting haptic engine: \(error.localizedDescription)")
		}
	}
	
	func complexSuccess() {
		guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
		
		var events = [CHHapticEvent]()
		for i in stride(from: 0, to: 1, by: 0.1) {
			let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
			let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
			let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
			
			events.append(event)
		}
		
		for i in stride(from: 0, to: 1, by: 0.1) {
			let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
			let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
			let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
			
			events.append(event)
		}
		
		do {
			let pattern = try CHHapticPattern(events: events, parameters: [])
			let player = try engine?.makePlayer(with: pattern)
			try player?.start(atTime: 0)
		} catch {
			print("Failed to play pattern: \(error.localizedDescription)")
		}
	}
	
}
#Preview {
	ContentView()
}




// CupCakeProject Code: 
// Multiple Views sloppy copy paste. 

// Challenges: 
// Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. 
// Improve the validation to make sure a string of pure whitespace is invalid.
// If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user.
// To test this, try commenting out the request.httpMethod = "POST" line in your code, which should force the request to fail.
// For a more challenging task, try updating the Order class so it saves data such as the user's delivery address to UserDefaults. 
// This takes a little thinking, because @AppStorage won't work here, and you'll find getters and setters cause
// problems with Codable support. Can you find a middle ground?