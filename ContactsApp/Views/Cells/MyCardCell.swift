import UIKit

class MyCardCell: UITableViewCell {
    
    private let nameLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let circularImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        circularImageView.translatesAutoresizingMaskIntoConstraints = false
        circularImageView.contentMode = .scaleAspectFill
        circularImageView.layer.cornerRadius = 25
        circularImageView.layer.masksToBounds = true
        contentView.addSubview(circularImageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        contentView.addSubview(nameLabel)
        
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        contentView.addSubview(phoneNumberLabel)
        
        NSLayoutConstraint.activate([
            circularImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            circularImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circularImageView.widthAnchor.constraint(equalToConstant: 50),
            circularImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 16),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            phoneNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        selectionStyle = .none

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with name: String, phoneNumber: String, image: String) {
        nameLabel.text = name
        phoneNumberLabel.text = phoneNumber
        circularImageView.image = UIImage(named: image)
    }
    
}
