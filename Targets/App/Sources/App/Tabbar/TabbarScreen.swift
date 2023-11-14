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
                        .scenario1(navigator: navigator)
                        .withStackContainer()
                        .withTabBarItem(.scenario1)
                )
                .setupTab(
                    with: screens
                        .scenario2(navigator: navigator)
                        .withStackContainer()
                        .withTabBarItem(.scenario2)
                )
                .selectTab(with: .index(0))
        }

        return view
    }
}

extension UITabBarItem {
    static let scenario1 = UITabBarItem(
        title: "Scenario 1",
        image: .init(systemName: ""),
        selectedImage: .init(systemName: "")
    )

    static let scenario2 = UITabBarItem(
        title: "Scenario 2",
        image: .init(systemName: ""),
        selectedImage: .init(systemName: "")
    )
}
