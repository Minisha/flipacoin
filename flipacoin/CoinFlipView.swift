import SwiftUI

struct CoinFlipView: View {
    @State private var isHeads: Bool
    @State private var headsCount: Int = 0
    @State private var tailsCount: Int = 0
    
    @Binding var initialImage: Image? // Accept initialImage as a binding

    
    init(initialImage: Binding<Image?>) {
            _initialImage = initialImage
            _isHeads = State(initialValue: true) // Initialize isHeads with a default value
            let initialImageName = "coinImage" // Replace with the actual initial image name
            if initialImageName == "headsImage" {
                headsCount = 1
            } else {
                tailsCount = 1
            }
        }
    
    struct CircularButtonStyle: ButtonStyle {
        let backgroundColor: Color // Custom background color
        
        init(backgroundColor: Color) {
            self.backgroundColor = backgroundColor
        }
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding(20)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(backgroundColor) // Use the custom background color
                )
        }
    }

        
    var body: some View {
        ZStack { // Use a ZStack to overlay the black background
//            LinearGradient(gradient: Gradient(colors: [Color(hex:"#EBEBE8"), Color(hex:"#31352E")]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                            .edgesIgnoringSafeArea(.all)
            Image("backgroundImage") // Replace "backgroundImage" with the name of your image asset
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all) // Ensure the image covers the entire view
                            .blur(radius: 25) // Add a blur effect with
            
            


        VStack {
            Spacer()
            initialImage?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .rotation3DEffect(.degrees(isHeads ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                .animation(.easeInOut(duration: 0.5))
            
     
            //
            HStack(spacing: 5) {
                // Heads count button
                Button(action: {}) {
                    Text("Heads:\(headsCount)")
                        .font(.body)
                        .padding()
                        .background(Color(hex: "#31352E"))
                        .foregroundColor(Color(hex: "#EBEBE8"))
                        .cornerRadius(50)
                }
                .disabled(true) // Disable the button
                
                // Tails count button
                Button(action: {}) {
                    Text("Tails:\(tailsCount)")
                        .font(.body)
                        .padding()
                        .background(Color(hex: "#31352E"))
                        .foregroundColor(Color(hex: "#EBEBE8"))
                        .cornerRadius(50)
                }
                .disabled(true) // Disable the button
             
            }   .padding(.top, 20)

            //
            
            HStack(spacing: 5) {
                Button(action: flipCoin) {
                    Image("flipCoin") // Replace with the image you want to use
                        .resizable()
                        .renderingMode(.original) // Use the original image colors
                        .frame(width: 100, height: 100) // Set the size of the button image
                        .aspectRatio(1, contentMode: .fit) // Set a 1:1 aspect ratio
                        .cornerRadius(50) // Make it round
                }
                .padding(.top, 20)

                Button(action: resetCounters) {
                    Text("Reset")
                        .font(.body) // Adjust the font size if needed
                        .padding()
                        .background(Color(hex: "#EBEBE8"))
                        .foregroundColor(.black)
                        .cornerRadius(50) // Make it round
                }
                .padding(.top, 20)
            }
            .padding(.top, 5)


            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func flipCoin() {
        let flipOutcome = Bool.random()
        if flipOutcome {
            headsCount += 1
            initialImage = Image("headsImage")
        } else {
            tailsCount += 1
            initialImage = Image("tailsImage")
        }
        
        withAnimation {
            isHeads.toggle()
        }
    }
    
    private func resetCounters() {
        headsCount = 0
        tailsCount = 0
        initialImage = Image("coinImage")    }
    
    
}


