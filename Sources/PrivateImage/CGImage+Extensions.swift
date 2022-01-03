import CoreGraphics
import AVFoundation
import CoreVideo

extension CGImage {
    var sampleBuffer: CMSampleBuffer? {
        guard let pixelBuffer = self.pixelBuffer else { return nil }
        CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly)
        defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly) }

        guard let formatDescription = try? CMVideoFormatDescription(imageBuffer: pixelBuffer) else { return nil }
        let timingInfo = CMSampleTimingInfo(
            duration: CMTime(value: 1, timescale: 30),
            presentationTimeStamp: .zero,
            decodeTimeStamp: .invalid
        )
        return try? CMSampleBuffer(
            imageBuffer: pixelBuffer,
            formatDescription: formatDescription,
            sampleTiming: timingInfo
        )
    }
    
    var pixelBuffer: CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer? = nil
        let ioSurfaceProperties = NSMutableDictionary()
        let options = NSMutableDictionary()
        options.setObject(ioSurfaceProperties, forKey: kCVPixelBufferIOSurfacePropertiesKey as NSString)

        
        CVPixelBufferCreate(
            kCFAllocatorDefault,
            Int(self.width),
            Int(self.height),
            kCVPixelFormatType_32ARGB,
            options as CFDictionary,
            &pixelBuffer
        )
        guard let pixelBuffer = pixelBuffer else {
            return nil
        }
        CVPixelBufferLockBaseAddress(pixelBuffer, [])
        defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, []) }

        let baseAddress = CVPixelBufferGetBaseAddress(pixelBuffer)
        guard let context = CGContext(
            data: baseAddress,
            width: Int(self.width),
            height: Int(self.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer),
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue
        ) else { return nil }
        let frame = CGRect(
            origin: .zero,
            size: CGSize(width: self.width, height: self.height)
        )
        context.clear(frame)
        context.draw(self, in: frame)

        return pixelBuffer
    }
}
