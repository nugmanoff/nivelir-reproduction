import UIKit
import Nivelir

struct AppScreens {
    func scenario1(navigator: ScreenNavigator) -> AnyModalScreen {
        Scenario1(navigator: navigator).eraseToAnyModalScreen()
    }
    
    func scenario2(navigator: ScreenNavigator) -> AnyModalScreen {
        Scenario2(navigator: navigator).eraseToAnyModalScreen()
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
