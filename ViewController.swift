import UIKit

protocol ContentProvider {
    var image: String { get }
    var title: String { get }
    var body: String { get }
    var primaryButtonTitle: String { get }
    var secondaryButtonTitle: String { get }
}

protocol FeedbackDelegate: AnyObject {
    func didTapPrimaryButton(_ viewController: UIViewController)
    func didTapSecondaryButton(_ viewController: UIViewController)
}

class ViewController: UIViewController {
    
    var contentProvider: ContentProvider?
    
    private lazy var ilustrationImageView: UIImageView = {
        let ilustrationImageView = UIImageView()
        ilustrationImageView.image = UIImage(named: contentProvider?.image ?? "")
        return ilustrationImageView
    }()
    
    private lazy var imageContainerView: UIView = {
        let containerView = UIView()
        containerView.addSubview(ilustrationImageView)
        return containerView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .darkGray
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.text = contentProvider?.title
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private lazy var bodyLabel: UILabel = {
        let bodyLabel = UILabel()
        bodyLabel.textColor = .darkGray
        bodyLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        bodyLabel.text = contentProvider?.body
        bodyLabel.textAlignment = .center
        return bodyLabel
    }()
    
    private lazy var primaryButton: UIButton = {
        let primaryButton = UIButton()
        primaryButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        primaryButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        primaryButton.setTitle(contentProvider?.primaryButtonTitle, for: .normal)
        primaryButton.addTarget(self, action: #selector(didTapPrimaryButton), for: .touchUpInside)
        return primaryButton
    }()
    
    private lazy var secondaryButton: UIButton = {
        let secondaryButton = UIButton()
        secondaryButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        secondaryButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        secondaryButton.setTitle(contentProvider?.secondaryButtonTitle, for: .normal)
        secondaryButton.addTarget(self, action: #selector(didTapSecondaryButton), for: .touchUpInside)
        return secondaryButton
    }()
    
    private lazy var contentStackView: UIStackView = {
        let contentStackView = UIStackView(arrangedSubviews: [imageContainerView,
                                                              titleLabel,
                                                              bodyLabel,
                                                              primaryButton,
                                                              secondaryButton])
        contentStackView.axis = .vertical
        contentStackView.spacing = 30
        return contentStackView
    }()
    
    init(contentProvider: ContentProvider? = nil, delegate: FeedbackDelegate) {
        self.contentProvider = contentProvider
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private weak var delegate: FeedbackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
    
    private func buildLayout() {
        view.backgroundColor = .white
        view.addSubview(contentStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        ilustrationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        ilustrationImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ilustrationImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ilustrationImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        ilustrationImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor).isActive = true
        ilustrationImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
        
        contentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    
    
    @objc func didTapPrimaryButton() {
        delegate?.didTapPrimaryButton(self)
    }
    
    @objc func didTapSecondaryButton() {
        delegate?.didTapSecondaryButton(self)
    }
}

