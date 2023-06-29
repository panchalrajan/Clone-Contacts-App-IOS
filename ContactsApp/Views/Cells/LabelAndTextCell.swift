import UIKit

class LabelAndTextCell: UITableViewCell {

    let headingLabel = UILabel()
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(headingLabel)
        contentView.addSubview(titleLabel)

        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 4).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        headingLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        titleLabel.textColor = .systemBlue
        titleLabel.numberOfLines = 0

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(headingText: String, text: String) {
        headingLabel.text = headingText
        titleLabel.text = text
    }
}
