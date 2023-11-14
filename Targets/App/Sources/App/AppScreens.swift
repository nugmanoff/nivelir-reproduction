import UIKit
import Nivelir

struct AppScreens {
    func rootScreen(_ titleText: String, _ color: UIColor, navigator: ScreenNavigator) -> AnyModalScreen {
        RootViewController(titleText: titleText, color: color, navigator: navigator).eraseToAnyModalScreen()
    }
    
    func parentScreen(id: String, navigator: ScreenNavigator) -> AnyModalScreen {
        ParentScreen(id: id, navigator: navigator).eraseToAnyModalScreen()
    }
    
    func childScreen(navigator: ScreenNavigator) -> AnyModalScreen {
        ChildScreen(navigator: navigator).eraseToAnyModalScreen()
    }
    
    func tabbarScreen(navigator: ScreenNavigator, screens: AppScreens) -> AnyTabsScreen {
        TabbarScreen(navigator: navigator, screens: screens).eraseToAnyTabsScreen()
    }
}
