import SwiftUI
import Dispatch

struct ContentViewl: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            Image("ikamba")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        .onAppear {
            // Simulate a delay (e.g., 2 seconds) before transitioning to the main content
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isActive = true
                
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            MainContentView()
        }
    }
}



struct MainContentView: View {
    
    var body: some View {
        // Your main app content goes here
    bridge()
    }
    
}

