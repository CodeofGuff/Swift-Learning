// Day 23 - 24

// Project 3


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
}



// Conditional Modifiers
struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            
            useRedText.toggle()            
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}
// Sometimes this BELOW is unavoidable, but try and use ABOVE example, ternary condition. 
var body: some View {
    if useRedText {
        Button("Hello World") {
            useRedText.toggle()
        }
        .foregroundStyle(.red)
    } else {
        Button("Hello World") {
            useRedText.toggle()
        }
        .foregroundStyle(.blue)
    }
}


// Enviroment Modifiers
VStack {
    Text("Gryffindor")
        .font(.largeTitle)
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title) // E.M.
// I like this
  VStack {
            Text("Gryffindor")
                .blur(radius: 3)
            Text("Hufflepuff")
                .blur(radius: 2)
            Text("Ravenclaw")
                .blur(radius: 1)
            Text("Slytherin")
        }
        


// Views as Properties
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("Look twice")
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.blue)
            motto2
        }
    }


// View Composition 
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)

            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
        }
    }
}
// LOOKS LIKE THIS WITH VIEW COMP: 
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            CapsuleText(text: "Second")
                .foregroundStyle(.yellow)

        }
    }
}



// Custom Mods
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello World")
                .modifier(Title())
        }
    }
}

// watermark
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
        
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
// custom ViewMods can have their own stored properties
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(15)
                .background(.black)
        }
    }
}
extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}


struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking With Swift")
        }
    }
}



// Custom Containers
// Quick Grid
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<rows, id: \.self) {row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Text("R\(row) C\(col)")
        }
    }
}
// Extre Spice on the ContentView
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content // @ViewBuilder to get the same effect as wrapping Image/Text in an HStack
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<rows, id: \.self) {row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
        }
    }
}
#Preview {
    ContentView()
}