// Day 32 - 34 -- Animations
// Project 6

// Animations look great, and help direct a users attention, and is clear where things go, or are going

// Growing Button using naimation
struct ContentView: View {
	
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@State private var animationAmount = 1.0
	
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			VStack {
				Button("Tap me") { animationAmount += 1 }
					.padding(50)
					.background(.red)
					.foregroundStyle(.white)
					.clipShape(.circle)
					.scaleEffect(animationAmount)
					.blur(radius: (animationAmount - 1) * 1.5)
					.animation(.default, value: animationAmount)
				
				Text("Hello, David")
					.foregroundStyle(.yellow)
					.font(.largeTitle)
					.bold()
				Button("Reset Button") { animationAmount = 1.0 }
					.bold()
					.foregroundStyle(.white)
					.clipShape(.capsule)
			}
		}
	}
}


// Pulsing Button
VStack {
	Button("Tap Me") {
		animationAmount += 2.0
	}
    .padding(50)
	.background(.red)
	.foregroundStyle(.white)
	.clipShape(.circle)
	.overlay(
		Circle()
			.stroke(.red)
			.scaleEffect(animationAmount)
	    	.opacity(2 - animationAmount)
			.animation(
				.easeInOut(duration: 1)
				.repeatForever(autoreverses: false),
				value: animationAmount
			)
	)
	.onAppear {
		animationAmount = 2
	}
}
				


// Animating with a Stepper
struct ContentView: View {
	
	@State private var animationAmount = 1.0
	
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	
	
	var body: some View {
		
		ZStack {
			mainColor.ignoresSafeArea()
			VStack {
				Stepper("Scale amount", value: $animationAmount.animation(.spring), in: 1...10)
					.padding()
					.padding()
					.padding()
				Spacer()
			}
			VStack{
				
				Button("Tap me") {
					animationAmount += 1
				}
				.padding(40)
				.background(.red)
				.foregroundStyle(.yellow)
				.clipShape(.circle)
				.scaleEffect(animationAmount)
				.animation(.bouncy, value: animationAmount)
				
			}
			VStack{
				Spacer()
				Text("Hello, David")
					.foregroundStyle(.yellow)
					.font(.largeTitle)
					.bold()
				
				Button("Reset Button") { animationAmount = 1.0 }
					.bold()
					.foregroundStyle(.white)
					.clipShape(.capsule)
			}
		}
	}
}



// Button goes wee!
struct ContentView: View {
	
	@State private var animationAmount: Double = 0.0
	
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)

	var body: some View {
		
		ZStack {
			mainColor.ignoresSafeArea()
			
			VStack{
				
				Button("Tap me") {
					withAnimation(.spring(duration: 1, bounce: 0.5)) {
						animationAmount += 360
					}
				}
				.padding(50)
				.background(.red)
				.foregroundStyle(.yellow)
				.clipShape(.circle)
                // BUTTON GOES WEE
				.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 2, z: 0))
		
			}
			
			VStack{
				Spacer()
				Text("Hello, David")
					.foregroundStyle(.yellow)
					.font(.largeTitle)
					.bold()
				
				Button("Reset Button") { animationAmount = 1.0 }
					.bold()
					.foregroundStyle(.white)
					.clipShape(.capsule)
			}
		}
	}
}



// Cool Button Animation:

@State private var enabled = false

Button("Tap me") {
		enabled.toggle()
	}
.frame(width: 200, height: 200)
.background(enabled ? .blue : .red)
.foregroundStyle(.yellow)
.animation(.spring(duration: 2, bounce: 0.2), value: enabled)

.clipShape(.rect(cornerRadius: enabled ? 60 : 0))
.animation(.spring(duration: 3, bounce: 0.2), value: enabled)


// bouncy card that drags

LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
	.frame(width: 300, height: 200)
	.clipShape(.rect(cornerRadius: 10))
	.offset(dragAmount)
	.gesture(
		DragGesture()
			.onChanged { dragAmount = $0.translation }
			.onEnded { _ in dragAmount = .zero }
	
	)
	.animation(.bouncy, value: dragAmount)


// To see explicit animations in action, remove that animation() modifier and change your
//  existing onEnded() drag gesture code to this:
.onEnded { _ in
    withAnimation(.bouncy) {
        dragAmount = .zero
    }
}


// Awesome drag animation

let letters = Array("Hello World")
	
@State private var enabled = false
@State private var dragAmount = CGSize.zero
	
HStack(spacing: 0) {
	ForEach(0..<letters.count, id: \.self) { num in
		Text(String(letters[num]))
			.padding(5)
			.font(.title)
			.background(enabled ? .blue : .red)
			.offset(dragAmount)
			.animation(.linear.delay(Double(num) / 20), value: dragAmount)
	}	
}
.gesture(
DragGesture()
	.onChanged { dragAmount = $0.translation }
	.onEnded { _ in
		dragAmount = .zero
		enabled.toggle()
	}

)


// Showing an dhidng views with Transitions

// scaling button
@State private var isShowingRed = false

Button("Tap Me") {
	withAnimation {
		isShowingRed.toggle()
	}
}
if isShowingRed{
	Rectangle()
		.fill(.red)
		.frame(width: 150, height: 150)
		.transition(.scale) //.transition(.asymmetric(insertion: .scale, removal: .opacity))
}



//using ViewModifier
// Try commenting out .clipped()
import SwiftUI


struct CornerRotateModifier: ViewModifier {
	let amount: Double
	let anchor: UnitPoint
	
	func body(content: Content) -> some View {
		content
			.rotationEffect(.degrees(amount), anchor: anchor)
			.clipped()
	}
}


extension AnyTransition {
	static var pivot: AnyTransition {
		.modifier(
			active: CornerRotateModifier(amount: -90, anchor: .topLeading),
			identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
		)
	}
}



struct ContentView: View {
	@State private var animationAmount: Double = 0.0
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@State private var isShowingRed = false
	
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			
			
			ZStack {
				Rectangle()
					.fill(.blue)
					.frame(width: 200, height: 200)
				
				if isShowingRed {
					Rectangle()
						.fill(.red)
						.frame(width: 200, height: 200)
						.transition(.pivot)
				}
			}
			
			.onTapGesture {
				withAnimation {
					isShowingRed.toggle()
				}
			}
					
		}
		
		
		
	}
}
