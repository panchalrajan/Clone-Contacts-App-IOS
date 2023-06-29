import UIKit

class AddButtonWithLabelCell: UITableViewCell {
    let plusImageView = UIImageView()
    let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI() {
        plusImageView.image = UIImage(systemName: "plus.circle.fill")
        plusImageView.tintColor = .systemGreen

        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .label

        contentView.addSubview(plusImageView)
        contentView.addSubview(label)

        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            plusImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            plusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            plusImageView.widthAnchor.constraint(equalToConstant: 25),
            plusImageView.heightAnchor.constraint(equalToConstant: 25),

            label.leadingAnchor.constraint(equalTo: plusImageView.trailingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with labelTitle: String) {
        label.text = labelTitle
    }
}
