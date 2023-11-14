import Nivelir
import UIKit

public final class TabbarController: UITabBarController, ScreenKeyedContainer {
    public var screenKey: ScreenKey
    
    public init(screenKey: ScreenKey) {
        self.screenKey = screenKey
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
