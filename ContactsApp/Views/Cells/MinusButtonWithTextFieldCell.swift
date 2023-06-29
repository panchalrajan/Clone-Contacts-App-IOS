import UIKit

protocol MinusButtonWithTextFieldCellDelegate: AnyObject {
    func didTapMinusButton(at indexPath: IndexPath)
}

class MinusButtonWithTextFieldCell: UITableViewCell {
    
    weak var delegate: MinusButtonWithTextFieldCellDelegate?

    let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        button.tintColor = .systemRed
        return button
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let textField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(minusButton)
        contentView.addSubview(dividerView)
        contentView.addSubview(textField)
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            minusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            minusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            
            dividerView.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 16),
            dividerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 1),
            dividerView.heightAnchor.constraint(equalTo: heightAnchor, constant: -16),
            
            textField.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])

        textField.placeholder = "Enter Text Here"
        textField.borderStyle = .none
        textField.autocorrectionType = .no

        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)

        selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(placeHolderText: String) {
        textField.placeholder = placeHolderText
    }
    
    @objc func minusButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? MinusButtonWithTextFieldCell else {
            return
        }
        
        guard let tableView = cell.superview as? UITableView else {
            return
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        delegate?.didTapMinusButton(at: indexPath)
    }
}
