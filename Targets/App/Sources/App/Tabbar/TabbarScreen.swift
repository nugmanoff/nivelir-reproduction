import UIKit
import Nivelir

struct TabbarScreen: Screen {
    var navigator: ScreenNavigator
    var screens: AppScreens

    func build(navigator: ScreenNavigator) -> UITabBarController {
        let view = TabbarController(screenKey: key)
        
        navigator.navigate(from: view) { route in
            route
                .setupTab(
                    with: screens
                        .rootScreen("First Tab", .white, navigator: navigator)
                        .withStackContainer()
                        .withTabBarItem(.firstTab)
                )
                .setupTab(
                    with: screens
                        .rootScreen("Second Tab", .white, navigator: navigator)
                        .withStackContainer()
                        .withTabBarItem(.secondTab)
                )
                .selectTab(with: .index(0))
        }

        return view
    }
}

extension UITabBarItem {
    static let firstTab = UITabBarItem(
        title: "First Tab",
        image: .init(systemName: ""),
        selectedImage: .init(systemName: "")
    )

    static let secondTab = UITabBarItem(
        title: "Second Tab",
        image: .init(systemName: ""),
        selectedImage: .init(systemName: "")
    )
}
