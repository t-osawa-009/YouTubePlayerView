import SwiftUI

struct ContentView: View {
    @State private var videoID = "aqz-KE-bpKQ" // Example video ID
    @State private var playsInline = true
    @State private var mute = true
    @State private var autoplay = true
    @State private var controls = true
    @State private var rel = false
    @State private var showInfo = false
    @State private var modestbranding = true
    @State private var ccLoadPolicy = true
    @State private var fs = true
    @State private var loop = false
    @State private var playlist: String? = nil
    @State private var enablejsapi = false
    @State private var origin: String? = nil
    
    var body: some View {
        VStack {
            // YouTube Player View fixed at the top
            YouTubePlayerView(
                videoID: videoID,
                playsInline: playsInline,
                mute: mute,
                autoplay: autoplay,
                controls: controls,
                rel: rel,
                showInfo: showInfo,
                modestbranding: modestbranding,
                ccLoadPolicy: ccLoadPolicy,
                fs: fs,
                loop: loop,
                playlist: playlist,
                enablejsapi: enablejsapi,
                origin: origin
            )
            .frame(height: 300)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()

            // Scrollable settings below the player
            ScrollView {
                VStack {
                    Text("Settings")
                        .font(.headline)
                        .padding()

                    // Video ID TextField
                    TextField("Enter YouTube Video ID", text: $videoID)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Toggle options for customizing the video player
                    Toggle("Plays Inline", isOn: $playsInline)
                        .padding()

                    Toggle("Mute", isOn: $mute)
                        .padding()

                    Toggle("Autoplay", isOn: $autoplay)
                        .padding()

                    Toggle("Show Controls", isOn: $controls)
                        .padding()

                    Toggle("Related Videos", isOn: $rel)
                        .padding()

                    Toggle("Show Video Info", isOn: $showInfo)
                        .padding()

                    Toggle("Modest Branding", isOn: $modestbranding)
                        .padding()

                    Toggle("Closed Captions", isOn: $ccLoadPolicy)
                        .padding()

                    Toggle("Fullscreen", isOn: $fs)
                        .padding()

                    Toggle("Loop Video", isOn: $loop)
                        .padding()

                    // TextField for Playlist (used for looping with same video)
                    TextField("Playlist Video ID (optional)", text: Binding(
                        get: { playlist ?? "" },
                        set: { playlist = $0.isEmpty ? nil : $0 }
                    ))
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    // Toggle to enable JavaScript API
                    Toggle("Enable JS API", isOn: $enablejsapi)
                        .padding()

                    // TextField for setting the origin
                    TextField("Origin URL (optional)", text: Binding(
                        get: { origin ?? "" },
                        set: { origin = $0.isEmpty ? nil : $0 }
                    ))
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

