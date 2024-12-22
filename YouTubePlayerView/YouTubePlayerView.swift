import SwiftUI
import WebKit

/// A custom SwiftUI view to embed and display a YouTube video.
/// - Parameters:
///   - videoID: The ID of the YouTube video.
///   - playsInline: A boolean indicating whether the video should play inline (default is `false`).
///   - mute: A boolean indicating whether the video should be muted (default is `false`).
///   - autoplay: A boolean indicating whether the video should autoplay (default is `false`).
struct YouTubePlayerView: UIViewRepresentable {
    
    // Properties
    let videoID: String
    let playsInline: Bool
    let mute: Bool
    let autoplay: Bool
    
    /// Creates and configures the WKWebView.
    /// - Parameter context: The SwiftUI context.
    /// - Returns: An initialized WKWebView.
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true // Allow inline playback.
        configuration.mediaTypesRequiringUserActionForPlayback = [] // Allow autoplay without user interaction.
        
        return WKWebView(frame: .zero, configuration: configuration)
    }
    
    /// Updates the WKWebView with the latest configuration.
    /// - Parameters:
    ///   - uiView: The WKWebView to update.
    ///   - context: The SwiftUI context.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Generate the YouTube embed HTML.
        let htmlGenerator = YouTubeEmbedHTMLGenerator(
            videoID: videoID,
            playsInline: playsInline,
            mute: mute,
            autoplay: autoplay
        )
        let embedHTML = htmlGenerator.generateHTML()
        
        // Load the generated HTML into the WebView.
        uiView.loadHTMLString(embedHTML, baseURL: nil)
    }
}
