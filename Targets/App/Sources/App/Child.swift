import UIKit
import Nivelir

struct ChildScreen: Screen {
    let navigator: ScreenNavigator
    
    func build(navigator: ScreenNavigator) -> UIViewController {
        ChildViewController(navigator: navigator)
    }
}

final class ChildViewController: UIViewController {
    let navigator: ScreenNavigator
    
    init(navigator: ScreenNavigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.title = "Child"
        
        let button = UIButton()
        button.setTitle(("Show Parent"), for: .normal)
        button.addTarget(self, action: #selector(onButtonDidTap), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        
        view.addSubviewStickToCenter(button)
    }
    
    @objc private func onButtonDidTap() {
        let screen = AppScreens().parentScreen(id: "123", navigator: navigator)
        
        navigator.navigate(from: stack) { route in
            route
                .last(.container(key: screen.key))
                .makeVisible()
                .fallback(
                    to: route.push(screen)
                )
        }
    }
}
