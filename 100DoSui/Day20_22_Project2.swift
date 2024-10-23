//Day 20 through 22

// Project 2 - Guess The Flag

// "This project is still going to be nice and easy, but gives me chance to introduce 
// you to whole range of new SwiftUI functionality:
// stacks, buttons, images, alerts, asset catalogs, and more."



// Using Stacks to arrange Views
// HStack
// VStack
// ZStack




// Guass effect

struct ContentView: View {
    var body: some View {
        ZStack {
            // Two seperate Colors on top an bottom
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            // Guass effect on the Click Me
            Text("Click me!")
                .foregroundStyle(.secondary)
                .padding()
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea() // most important three words
    }
}




// Gradient
struct ContentView: View {
   var body: some View {
        LinearGradient(stops: [
            Gradient.Stop(color: .gray, location: 0.1),
            Gradient.Stop(color: .blue, location: 0.9)
        ], startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
            }
}
LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()


struct ContentView: View {
    var body: some View {
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            }
}


struct ContentView: View {
    var body: some View {
        AngularGradient(colors: [.blue, .black, .red, .yellow, .purple, .purple, .purple, .red, .blue], center: .center)
            }
}






// Buttons
struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button 1") {}
                .buttonStyle(.bordered)
        
            Button("Button 2") {}
                .buttonStyle(.borderedProminent)
            
            Button("Button 3", role: .destructive) {}
                .buttonStyle(.bordered)
                .tint(.indigo)
            
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            
        }
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                print("Button was tapped!")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
        }
    }
}







// Showing Alerts
struct ContentView: View {
    @State private var showingAlert = false
    
    
    var body: some View {
        VStack {
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("ARE YOU SURE?", isPresented: $showingAlert) {
                Button("YES!", role: .destructive)  { }
                Button("NO!", role: .cancel) { }
            } message: {
                Text("This delete's everything forever")
            }
        }
    }
}