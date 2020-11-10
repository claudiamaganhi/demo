import UIKit

class FirstViewController: UIViewController, FeedbackDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapMeButton()
    }
    
    func didTapPrimaryButton() {
        print("did tap primary button")
    }
    
    func didTapSecundaryButton() {
        print("did tap secundary button")
    }
    
    @objc func didTapButton() {
        let nextVC = ViewController(contentProvider: Info(), delegate: self)
        present(nextVC, animated: true, completion: nil)
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
    var secundaryButtonTitle: String = "Second button"
}
