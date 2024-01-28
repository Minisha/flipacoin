import SwiftUI

struct ContentView: View {
    @State private var initialImage: Image? = Image("coinImage")
       
       var body: some View {
           CoinFlipView(initialImage: $initialImage) // Pass initialImage as a binding
       }
}
