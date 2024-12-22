/// A class responsible for generating the HTML required to embed a YouTube video.
final class YouTubeEmbedHTMLGenerator {
    
    private let videoID: String
    private let playsInline: Bool
    private let mute: Bool
    private let autoplay: Bool
    private let controls: Bool
    private let rel: Bool
    private let showInfo: Bool
    private let modestbranding: Bool
    private let ccLoadPolicy: Bool
    private let fs: Bool
    private let loop: Bool
    private let playlist: String?
    private let enablejsapi: Bool
    private let origin: String?
    
    // Initializer
    init(
        videoID: String,
        playsInline: Bool = true,
        mute: Bool = true,
        autoplay: Bool = true,
        controls: Bool = true,
        rel: Bool = false,
        showInfo: Bool = false,
        modestbranding: Bool = true,
        ccLoadPolicy: Bool = true,
        fs: Bool = true,
        loop: Bool = false,
        playlist: String? = nil,
        enablejsapi: Bool = false,
        origin: String? = nil
    ) {
        self.videoID = videoID
        self.playsInline = playsInline
        self.mute = mute
        self.autoplay = autoplay
        self.controls = controls
        self.rel = rel
        self.showInfo = showInfo
        self.modestbranding = modestbranding
        self.ccLoadPolicy = ccLoadPolicy
        self.fs = fs
        self.loop = loop
        self.playlist = playlist
        self.enablejsapi = enablejsapi
        self.origin = origin
    }
    
    /// Generates the HTML for embedding a YouTube video.
    /// - Returns: A string containing the HTML for embedding the YouTube video.
    func generateHTML() -> String {
        var embedURL = "https://www.youtube.com/embed/\(videoID)?playsinline=\(playsInline ? "1" : "0")"
        
        // Add parameters conditionally
        if autoplay { embedURL += "&autoplay=1" }
        if controls { embedURL += "&controls=1" }
        if rel { embedURL += "&rel=1" }
        if !showInfo { embedURL += "&showinfo=0" }
        if modestbranding { embedURL += "&modestbranding=1" }
        if ccLoadPolicy { embedURL += "&cc_load_policy=1" }
        if fs { embedURL += "&fs=1" }
        if loop { embedURL += "&loop=1" }
        if let playlist = playlist, loop {
            embedURL += "&playlist=\(playlist)"
        }
        if enablejsapi { embedURL += "&enablejsapi=1" }
        if let origin = origin { embedURL += "&origin=\(origin)" }
        
        // Return the final HTML string
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
        <iframe src="\(embedURL)"
                frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                allowfullscreen>
        </iframe>
        </body>
        </html>
        """
    }
}

