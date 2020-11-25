import UIKit

class FirstViewController: UIViewController, FeedbackDelegate {
    
    lazy var contentController1: UIViewController = {
        let contentProvider: ContentProvider = Info()
        let viewController = ViewController(contentProvider: contentProvider, delegate: self)
        return viewController
    }()
    
    lazy var contentController2: UIViewController = {
        let contentProvider: ContentProvider = InfoTwo()
        let viewController = ViewController(contentProvider: contentProvider, delegate: self)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapMeButton()
    }
    
    func didTapPrimaryButton(_ viewController: UIViewController) {
        switch viewController {
        case contentController1:
            print("did tap primary button from controller 1")
        case contentController2:
            print("did tap primary button from controller 2")
        default:
            print("invalid")
        }
    }
    
    func didTapSecondaryButton(_ viewController: UIViewController) {
        switch viewController {
        case contentController1:
            print("did tap secondary button from controller 1")
        case contentController2:
            print("did tap secondary button from controller 2")
        default:
            print("invalid")
        }
    }
    
    @objc func didTapButton() {
        guard let controller = [contentController1, contentController2].randomElement() else { return }
        present(controller, animated: true, completion: nil)
    }
    
    private func setTapMeButton() {
        let button: UIButton = {
            let primaryButton = UIButton()
            primaryButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            primaryButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            primaryButton.setTitle("tap me", for: .normal)
            primaryButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            return primaryButton
        }()
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
    var title: String = "This is the second title"
    var body: String = "This is the sencond body"
    var primaryButtonTitle: String = "First button 2"
    var secondaryButtonTitle: String = "Second button 2"
}
