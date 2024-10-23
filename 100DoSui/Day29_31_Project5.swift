// Day 29 - 31 

// Project 5 - Word Scramble


// List for working with tables of data, and strings, for handling text. 
// Yes, we covered strings quite a bit already, but now we’re really going to dig into them, 
// including how to work with their Unicode representation so we can get compatibility with older Objective-C frameworks.

//  you’ll meet List, onAppear(), Bundle, fatalError(), and more – 
// all useful skills that you’ll use for years to come. Practice with @State, NavigationStack.


// List, Bundle, UITextChecker
//  List is to provide a scrolling table of data.
let people = ["Fiin", "Luke", "Bilbo", "JarJar"]
List {
    Section("Dynamix") {
	    ForEach(0..<5) {
		    Text("Dynamic Row \($0)")
        }
    }
}
.listStyle(.grouped)

List {
	Section("SciFi") {
		ForEach(people, id: \.self) {
			Text($0)
		}
	}
}
.listStyle(.grouped)


// Loading resocurces from the app bundle 
func testBundles() {
	if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
		if let fileContent = try? String(contentsOf: fileURL) {
			// loaded file into Str!
		}
	}
}



// Working with Strings
// makes a 3 item array of string where a break or in this case a space is found
func testStrings() {
	let input = "a b c"
	let letters = input.components(separatedBy: " ")
}

// makes a 3 item array of string where a break or in this case a space is found
func testStrings() {
	let input = """
			a
			b
			c
			"""
	let letters = input.components(separatedBy: "\n")
}

func testStrings() {
	let input = """
			a
			b
			c
			"""
	let letters = input.components(separatedBy: "\n")
	let letter = letters.randomElement() // returns an opt value. Maybe a? maybe b?
	let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines) // clears whitespaces and new lines
}

func testStrings() {
	let word = "swift" // word to check
	let checker = UITextChecker()
	
	let range = NSRange(location: 0, length: word.utf16.count)
		
	// check our word in range, with a start of beginning or 0, don't want to wrap, and in english
	// sends back an OB-C Str Range
	let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		
	// check if hte spelling result contains a mistake
	let allGood = misspelledRange.location == NSNotFound
}



// Creating a startGame func that throws a fatal error if the conditions arnt met, clsoing the ap. 
func startGame() {
	if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
		if let startWords = try? String(contentsOf: startWordsURL) {
			let allWords = startWords.components(separatedBy: "\n")
			rootWord = allWords.randomElement() ?? "silkworm"
			return
		}
	}
	
	fatalError("Could not load start.txt from bundle.")
	
}


// UITextChecker
// doesnt allow the user to enter invalid words



// FINAL CONTENT VIEW CODE BASE
//Seperate start.txt file used to 10k 8 letter words. 
import SwiftUI

struct ContentView: View {
	
	@State private var usedWords = [String]()
	@State private var rootWord = ""
	@State private var newWord = ""
	
	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showingError = false
	
	
	var body: some View {
		NavigationStack {
			List {
				Section {
					TextField("Enter your word", text: $newWord)
						.textInputAutocapitalization(.never)
				}
				
				Section {
					ForEach(usedWords, id: \.self) { word in
						HStack {
							Image(systemName: "\(word.count).circle")
							Text(word)
						}
					}
				}
			}
			.navigationTitle(rootWord)
			.onSubmit(addNewWord)
			.onAppear(perform: startGame)
			.alert(errorTitle, isPresented: $showingError) {
				Button("OK") { }
			} message: {
				Text(errorMessage)
			}
		}
	}
	
	func addNewWord() {
		// lower case and trims the word, doesnt allow words with extra spaces
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		
		guard answer.count > 0 else { return }
		
		guard isOriginal(word: answer) else {
			wordError(title: "Word used already!", message: "Be more original!")
			return
		}
		
		guard isPossible(word: answer) else {
			wordError(title: "Word not possible!", message: "You can't spell that word from '\(rootWord)'!")
			return
		}
		
		guard isReal(word: answer) else {
			wordError(title: "Word not recognized", message: "You can't just make them up!")
			return
		}
		
		withAnimation {
			usedWords.insert(answer, at: 0)
		}
		
		newWord = ""
	}
	
	func startGame() {
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			if let startWords = try? String(contentsOf: startWordsURL) {
				let allWords = startWords.components(separatedBy: "\n")
				rootWord = allWords.randomElement() ?? "silkworm"
				return
			}
		}
		fatalError("Could not load start.txt from bundle.")
	}
	// used words contains the word we used, if it contains it it is not original
	func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}
	
	// check if words are made out of letters of another words
	func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		
		for letter in word {
			if let pos = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: pos)
			} else {
				return false
			}
		}
		return true
	}
	
	//UIKit text checker
	func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		return misspelledRange.location == NSNotFound
	}
	
	func wordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
}

#Preview {
	ContentView()
}
