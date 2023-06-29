import UIKit

class MyBigCardCell: UITableViewCell {
    
    private let myStack = UIStackView()
    private let circularImageView = UIImageView()
    private let addImageButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        circularImageView.translatesAutoresizingMaskIntoConstraints = false
        circularImageView.contentMode = .scaleAspectFill
        circularImageView.layer.cornerRadius = 75
        circularImageView.layer.masksToBounds = true
        contentView.addSubview(circularImageView)
        
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.setTitle("Add Photo", for: .normal)
        addImageButton.setTitleColor(.systemBlue, for: .normal)
        contentView.addSubview(addImageButton)
        
        NSLayoutConstraint.activate([
            circularImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circularImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            circularImageView.widthAnchor.constraint(equalToConstant: 150),
            circularImageView.heightAnchor.constraint(equalToConstant: 150),
            
            addImageButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addImageButton.topAnchor.constraint(equalTo: circularImageView.bottomAnchor, constant: 16)
        ])
        
        selectionStyle = .none

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: String) {
        circularImageView.image = UIImage(named: image)
    }
    
}
