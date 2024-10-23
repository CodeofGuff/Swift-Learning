

import SwiftUI

struct ContentView: View {
	
	@State private var animationAmount = 1.0
	@State private var rotationAmount = 0.0

	
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	
	
	var body: some View {
		
		ZStack {
			mainColor.ignoresSafeArea()
			VStack {
				Stepper("Scale amount", value: $animationAmount.animation(.spring))
					.padding()
					.padding()
					.padding()
					.foregroundColor(.yellow);
				Spacer()
			}
			VStack{
				
				Button("Tap me") {
					animationAmount += 1
					withAnimation(.spring(duration: 1, bounce: 0.5)) {
						rotationAmount += 360
					}
				}
				.padding(40)
				.background(.red)
				.foregroundStyle(.yellow)
				.clipShape(.circle)
				.scaleEffect(animationAmount)
				.animation(.bouncy, value: animationAmount)
				.rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 0, z: 1))
				
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

#Preview {
	ContentView()
}
