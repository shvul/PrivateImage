import SwiftUI
import AVFoundation

public struct PrivateImageView: UIViewRepresentable {
    
    private var image: UIImage?
    private var imageContentMode: AVLayerVideoGravity
    private var preventCapture: Bool
    
    public init(
        image: UIImage? = nil,
        imageContentMode: AVLayerVideoGravity = .resizeAspect,
        preventCapture: Bool = true
    ) {
        self.image = image
        self.imageContentMode = imageContentMode
        self.preventCapture = preventCapture
    }

    public func makeUIView(context: Context) -> UIPrivateImageView {
        let view = UIPrivateImageView(image: self.image)
        view.preventsCapture = self.preventCapture
        view.imageContentMode = self.imageContentMode
        return view
    }

    public func updateUIView(_ uiView: UIPrivateImageView, context: Context) {
        uiView.imageContentMode = self.imageContentMode
        uiView.preventsCapture = self.preventCapture
        uiView.updateImage(to: self.image)
    }
}

public extension PrivateImageView {
    func imageContentMode(imageContentMode: AVLayerVideoGravity) -> PrivateImageView {
        var view = self
        view.imageContentMode = imageContentMode
        return view
    }
    
    func image(_ image: UIImage?) -> PrivateImageView {
        var view = self
        view.image = image
        return view
    }
    
    func preventCapture(_ prevent: Bool) -> PrivateImageView {
        var view = self
        view.preventCapture = prevent
        return view
    }
}
