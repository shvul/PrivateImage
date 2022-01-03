import UIKit
import AVFoundation

public class UIPrivateImageView: UIView {
    public init(image: UIImage? = nil) {
        super.init(frame: .zero)
        self.layer.preventsCapture = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public class var layerClass: AnyClass {
        AVSampleBufferDisplayLayer.self
    }
    
    override public var layer: AVSampleBufferDisplayLayer {
        super.layer as! AVSampleBufferDisplayLayer
    }
    
    public var preventsCapture: Bool {
        get {
            self.layer.preventsCapture
        }
        set {
            self.layer.preventsCapture = newValue
        }
    }
    
    public var imageContentMode: AVLayerVideoGravity {
        get {
            self.layer.videoGravity
        }
        set {
            self.layer.videoGravity = newValue
        }
    }
    
    public func updateImage(to image: UIImage?) {
        self.layer.flushAndRemoveImage()
        guard let sampleBuffer = image?.cgImage?.sampleBuffer else { return }
        self.layer.enqueue(sampleBuffer)
    }
}
