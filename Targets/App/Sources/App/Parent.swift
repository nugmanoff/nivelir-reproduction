import UIKit
import Nivelir


struct ParentScreen: Screen {
    let id: String
    let navigator: ScreenNavigator
    
    var traits: Set<AnyHashable> {
        [id]
    }
    
    func build(navigator: ScreenNavigator) -> UIViewController {
        ParentViewController(id: id, navigator: navigator)
    }
}

final class ParentViewController: UIViewController {
    let id: String
    let navigator: ScreenNavigator
    
    init(id: String, navigator: ScreenNavigator) {
        self.id = id
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        navigationItem.title = "Parent"
        
        let button = UIButton()
        button.setTitle(("Show Child"), for: .normal)
        button.addTarget(self, action: #selector(onButtonDidTap), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        
        view.addSubviewStickToCenter(button)
    }
    
    @objc private func onButtonDidTap() {
        let screen = AppScreens().childScreen(navigator: navigator)
        navigator.navigate(from: stack) { route in
            route.push(screen)
        }
    }
}
