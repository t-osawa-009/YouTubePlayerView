import SwiftUI
import WebKit

struct ContentView: View {
    @State private var videoID: String = "aqz-KE-bpKQ"
    @State private var playsInline = true
    @State private var mute = true
    @State private var autoplay = true

    var body: some View {
        VStack {
            Text("YouTube Player")
                .font(.headline)
                .padding()

            YouTubePlayerView(videoID: videoID, playsInline: playsInline, mute: mute, autoplay: autoplay)
                .frame(height: 300)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()

            TextField("Enter YouTube Video ID", text: $videoID)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
            
            Toggle("Plays Inline", isOn: $playsInline)
                .padding()

            Toggle("Mute", isOn: $mute)
                .padding()

            Toggle("Autoplay", isOn: $autoplay)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

