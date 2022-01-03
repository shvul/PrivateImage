import SwiftUI
import PrivateImage

struct SwiftUIExampleView: View {
    
    @State var preventCapture = true
    
    var body: some View {
        VStack {
            Text("Example")
            PrivateImageView(image: UIImage(named: "test-image"), preventCapture: self.preventCapture)
                .imageContentMode(imageContentMode: .resizeAspectFill)
            Toggle("Prevent capture", isOn: self.$preventCapture)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
    }
}
