
import UIKit

class OnboardingView: UIView {
    
    var clickStartButton: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - criar elementos
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bkgImage")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var startButton: UIButton = {
        let view = UIButton()
        view.setTitle("VER LISTA", for: .normal)
        view.setTitleColor(UIColor.systemBackground, for: .normal)
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(self.didTapStartButton), for: .touchUpInside)
        return view
    }()
    

    // MARK: - Set Up
    
    private func setupView(){
        self.addSubview(self.backgroundImageView)
        self.addSubview(self.startButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // button  ----------------------------------------------
            self.startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.startButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            self.startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.startButton.heightAnchor.constraint(equalToConstant: 50),
            
            // background ----------------------------------------------
            self.backgroundImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
        ])

    }
    
    // MARK: - Button action
    
    @objc func didTapStartButton(){
        self.clickStartButton?()
    }
}

