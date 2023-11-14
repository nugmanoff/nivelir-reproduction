import UIKit
import Nivelir

final class RootViewController: UIViewController, Screen {
    let titleText: String
    let color: UIColor
    let navigator: ScreenNavigator
    
    init(titleText: String, color: UIColor, navigator: ScreenNavigator) {
        self.titleText = titleText
        self.color = color
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        navigationItem.title = "Root"
        
        let label = UILabel()
        label.text = titleText
        label.font = .systemFont(ofSize: 48)
        label.textAlignment = .center
        label.textColor = .black
        
        let button = UIButton()
        button.setTitle(("Show Child"), for: .normal)
        button.addTarget(self, action: #selector(onButtonDidTap), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [
            label,
            button
        ])
        
        stackView.axis = .vertical
        
        view.addSubviewStickToCenter(stackView)
    }
    
    @objc private func onButtonDidTap() {
        let screen = AppScreens().childScreen(navigator: navigator)
        navigator.navigate(from: stack) { route in
            route.push(screen)
        }
    }
}

public extension UIView {
    func addSubviewStickingToEdges(_ view: UIView, with insets: UIEdgeInsets = .zero) {
        addSubview(view)
        view.pinToSuperview(insets: insets)
    }
    
    func addSubviewStickToCenter(_ view: UIView) {
        addSubview(view)
        view.pinToCenter()
    }
    
    func pinToSuperview(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right)
        ])
    }
    
    func pinToCenter(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }
}
