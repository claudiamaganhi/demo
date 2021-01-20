import UIKit

class FirstViewController: UIViewController, FeedbackDelegate {
    
    lazy var contentController1: UIViewController = {
        let content: ContentProvider = Info()
        let nextVC = ViewController(contentProvider: content, delegate: self)
        return nextVC
    }()
    
    lazy var contentController2: UIViewController = {
        let content: ContentProvider = InfoTwo()
        let nextVC = ViewController(contentProvider: content, delegate: self)
        return nextVC
    }()
    
    private lazy var collectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.setTitle("Collection Button", for: .normal)
        button.addTarget(self, action: #selector(didTapCollectionButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var tapButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.setTitle("tap me", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [tapButton, collectionButton])
        stackView.axis = .vertical
        stackView.spacing = 10.0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapMeButton()
    }
    
    func didTapPrimaryButton(_ viewController: UIViewController) {
        switch viewController {
        case contentController1:
            print("did tap primary button 1")
        case contentController2:
            print("did tap primary button 2")
        default:
            print("Invalid")
        }
    }
    
    func didTapSecondaryButton(_ viewController: UIViewController) {
        switch viewController {
        case contentController1:
            print("did tap secondary button 1")
        case contentController2:
            print("did tap secondary button 2")
        default:
            print("Invalid")
        }
    }
    
    @objc func didTapButton() {
        guard let controller = [contentController1, contentController2].randomElement() else { return }
        present(controller, animated: true, completion: nil)
    }
    
    @objc func didTapCollectionButton() {
        let controller = CollectionDemoViewController()
        let navigation = UINavigationController(rootViewController: controller)
        present(navigation, animated: true)
    }
    
    private func setTapMeButton() {
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

class Info: ContentProvider {
    var image: String = "arcade"
    var title: String = "This is the title"
    var body: String = "This is the body"
    var primaryButtonTitle: String = "First button"
    var secondaryButtonTitle: String = "Second button"
}

class InfoTwo: ContentProvider {
    var image: String = "arcade"
    var title: String = "This is the title 2"
    var body: String = "This is the body 2"
    var primaryButtonTitle: String = "First button 2"
    var secondaryButtonTitle: String = "Second button 2"
}
