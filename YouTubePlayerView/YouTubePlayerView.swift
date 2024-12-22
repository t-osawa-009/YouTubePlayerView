import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String
    let playsInline: Bool
    let mute: Bool
    let autoplay: Bool
    let controls: Bool
    let rel: Bool
    let showInfo: Bool
    let modestbranding: Bool
    let ccLoadPolicy: Bool
    let fs: Bool
    let loop: Bool
    let playlist: String?
    let enablejsapi: Bool
    let origin: String?

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true // Enable inline playback
        config.mediaTypesRequiringUserActionForPlayback = [] // Allow autoplay without user interaction
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Generate the HTML using the YouTubeEmbedHTMLGenerator
        let htmlGenerator = YouTubeEmbedHTMLGenerator(
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
        
        let embedHTML = htmlGenerator.generateHTML()
        uiView.loadHTMLString(embedHTML, baseURL: nil)
    }
}

