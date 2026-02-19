import SwiftUI

struct ContentView: View {
    @State private var currentURL = URL(string: "https://www.apple.com")!
    @State private var addressText = "apple.com"

    var body: some View {
        ZStack(alignment: .top) {
            // The Main Engine (We will build this file next!)
            TitaniumWebView(url: $currentURL)
                .ignoresSafeArea()

            // The Floating "Titanium" Bar
            VStack {
                HStack {
                    Image(systemName: "shield.fill") // The Titanium Shield Icon
                        .foregroundColor(.blue)
                    
                    TextField("Titanium Search", text: $addressText)
                        .onSubmit {
                            loadPage()
                        }
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                        .padding(8)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                    
                    Button(action: { loadPage() }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                // This gives it the high-end Apple/Mammoth frosted glass look
                .background(.ultraThinMaterial) 
                .cornerRadius(20)
                .padding()
                
                Spacer()
            }
        }
    }

    func loadPage() {
        var target = addressText.lowercased()
        if !target.hasPrefix("http") {
            target = "https://" + target
        }
        if let newURL = URL(string: target) {
            currentURL = newURL
        }
    }
}
