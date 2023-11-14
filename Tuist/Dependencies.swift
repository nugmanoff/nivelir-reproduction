import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/hhru/Nivelir.git", requirement: .upToNextMajor(from: "1.6.3")),
            .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.1")),
        ]
    ),
    platforms: [.iOS]
)
