/// A class responsible for generating the HTML required to embed a YouTube video.
final class YouTubeEmbedHTMLGenerator {
    
    private let videoID: String
    private let playsInline: Bool
    private let mute: Bool
    private let autoplay: Bool
    
    // Initializer
    init(
        videoID: String,
        playsInline: Bool,
        mute: Bool,
        autoplay: Bool
    ) {
        self.videoID = videoID
        self.playsInline = playsInline
        self.mute = mute
        self.autoplay = autoplay
    }
    
    /// Generates the HTML for embedding a YouTube video.
    /// - Returns: A string containing the HTML for embedding the YouTube video.
    func generateHTML() -> String {
        return """
        <!DOCTYPE html>
        <html>
        <head>
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0">
        <style>
        body { margin: 0; padding: 0; background-color: black; }
        iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
        </style>
        </head>
        <body>
        <iframe src="https://www.youtube.com/embed/\(videoID)?playsinline=\(playsInline ? "1" : "0")&autoplay=\(autoplay ? "1" : "0")&mute=\(mute ? "1" : "0")&rel=0" 
                frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                allowfullscreen>
        </iframe>
        </body>
        </html>
        """
    }
}
