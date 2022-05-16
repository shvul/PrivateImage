import UIKit
import PrivateImage

final class UIKitExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIPrivateImageView(image: UIImage(named: "test-image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        imageView.imageContentMode = .resizeAspect
    }
}

