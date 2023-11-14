import ProjectDescription

enum App {
    static let bundleId = "nivelir.reproduction"
    static let displayName = "Nivelir Reproduction"
    static let organizationName = "nugmanoff"
    static let deploymentTarget = "14.0"
    
    static let developmentTeamId = "J5UZ92Q7C8"
    static let targetName = "App"
}

extension Project {
    public static func main() -> Project {
        Project(
            name: App.targetName,
            organizationName: App.organizationName,
            targets: [
                app(name: App.targetName, dependencies: [
                    .external(name: "Nivelir"),
                    .external(name: "SnapKit"),
                ]),
            ],
            fileHeaderTemplate: .string("")
        )
    }
    
    private static func app(name: String, dependencies: [TargetDependency] = []) -> Target {
        return Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: "nivelir.reproduction",
            deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone, .ipad]),
            infoPlist: .extendingDefault(with: ["UIMainStoryboardFile": "",
                                                "UILaunchStoryboardName": "LaunchScreen", "UIUserInterfaceStyle": "Light"]),
            sources: ["Targets/App/Sources/**"],
            resources: ["Targets/App/Resources/**"],
            dependencies: dependencies
        )
    }
}
