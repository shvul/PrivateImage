# SecretImage

Image view with DRM protection for SwiftUI and UIKit.

## What?

This view can't be captured via iOS screenshot feature or screen recording.

<img src="https://raw.githubusercontent.com/shvul/PrivateImage/main/Example/PrivateImageExample.png" width="460" height="435">

## Usage

Create `PrivateImageView` for SwiftUI and `UIPrivateImageView` for UIKit and pass UIImage as input:

``` swift
PrivateImageView(image: UIImage(named: "test-image"))
```

It will automatically prevent capture for this content image.

For more examples check out [Example Project](/Example/)

## Installation

Use SPM:

``` swift
dependencies: [
    .package(url: "https://github.com/shvul/PrivateImage.git", .upToNextMajor(from: "1.0.0"))
]
```
