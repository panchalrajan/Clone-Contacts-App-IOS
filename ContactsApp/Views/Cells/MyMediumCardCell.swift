import UIKit

class MyMediumCardCell: UITableViewCell {
    
    private let myStack = UIStackView()
    private let circularImageView = UIImageView()
    private let titleLabel = UILabel()
    private let companyLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        circularImageView.translatesAutoresizingMaskIntoConstraints = false
        circularImageView.contentMode = .scaleAspectFill
        circularImageView.layer.cornerRadius = 50
        circularImageView.layer.masksToBounds = true
        contentView.addSubview(circularImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        contentView.addSubview(titleLabel)
        
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(companyLabel)
        
        NSLayoutConstraint.activate([
            circularImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circularImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            circularImageView.widthAnchor.constraint(equalToConstant: 100),
            circularImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: circularImageView.bottomAnchor, constant: 16),
            
            companyLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            companyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
        
        selectionStyle = .none

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: String, fullName: String, company: String? = nil) {
        circularImageView.image = UIImage(named: image)
        titleLabel.text = fullName
        if let company = company {
            companyLabel.text = company
            companyLabel.isHidden = false
        } else {
            companyLabel.isHidden = true
        }
    }
    
}
