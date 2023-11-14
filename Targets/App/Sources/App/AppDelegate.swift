import UIKit
import Nivelir

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        setupNavigation()
        return true
    }
    
    var navigator: ScreenNavigator?
    var screens = AppScreens()
    
    private func setupNavigation() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window = window
        
        let navigator = ScreenNavigator(window: window)
        self.navigator = navigator
        
        navigator.navigate(
            to: ScreenWindowRoute()
                .setRoot(to: screens.tabbarScreen(navigator: navigator, screens: screens))
                .makeKeyAndVisible()
        )
    }
    
}
