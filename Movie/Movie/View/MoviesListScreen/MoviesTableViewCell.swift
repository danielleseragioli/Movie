
import Foundation
import UIKit
import SDWebImage

class MoviesTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    // MARK: - criando elementos da célula
    
    lazy var calendarButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "calendar.badge.plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.tintColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCalendarButton), for: .touchUpInside)
        return button
    }()
    
    lazy var  titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        return label
    }()
    
    lazy var titlePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(titlePosterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(calendarButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Constraints
    
    func setupConstraints(){
        
        let titlePosterImageViewConstraints = [
            titlePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePosterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant:  UIScreen.main.bounds.width / 3 - 10)

        ]
        
        let calendarTitleButtonConstraints = [
            calendarButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            calendarButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePosterImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(calendarTitleButtonConstraints)
        
    }
    

    // MARK: - @objc
        
    @objc func didTapCalendarButton (){
        
        let alert = UIAlertController(title: "Adicionar ao calendário", message: "Adicione a data de lançamento ao seu calendário", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        if (self.calendarButton.tintColor == .systemPink ) {
            alert.addAction(UIAlertAction(title: "Adicionar", style: .default, handler: { [weak self] _ in

                self?.calendarButton.setImage(UIImage(systemName: "calendar.badge.minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
                self?.calendarButton.tintColor = .secondarySystemBackground
                
            }))

        }else {
            
            let alert = UIAlertController(title: "Remover do calendário", message: "Deseja remover a data de lançamento do seu calendário?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { [weak self]_ in
                self?.calendarButton.setImage(UIImage(systemName: "calendar.badge.minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
                self?.calendarButton.tintColor = .secondarySystemBackground
            }))
            
            alert.addAction(UIAlertAction(title: "Remover", style: .destructive, handler: { _ in
                self.calendarButton.setImage(UIImage(systemName: "calendar.badge.plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
                self.calendarButton.tintColor = .systemPink
            }))
            
            
           
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)

        
    }
  
    

}


