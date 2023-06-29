import UIKit

class PlaceHolderCell: UITableViewCell {

    let textField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        textField.placeholder = "Enter Text Here"
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        textField.clearButtonMode = .whileEditing

        selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(placeHolderText: String) {
        textField.placeholder = placeHolderText
    }
}
