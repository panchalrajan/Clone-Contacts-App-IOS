import UIKit

class HorizontalCellsCell: UITableViewCell {
    
    let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        let cell1 = createSquareCell(image: "message.fill", labelText: "Message")
        let cell2 = createSquareCell(image: "phone.fill", labelText: "Call")
        let cell3 = createSquareCell(image: "video.fill", labelText: "Video")
        let cell4 = createSquareCell(image: "envelope.fill", labelText: "Mail")
        
        stackView.addArrangedSubview(cell1)
        stackView.addArrangedSubview(cell2)
        stackView.addArrangedSubview(cell3)
        stackView.addArrangedSubview(cell4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSquareCell(image: String, labelText: String) -> UIView {
        let cell = UIView()
        cell.layer.cornerRadius = 10
        
        if self.traitCollection.userInterfaceStyle == .dark {
            cell.backgroundColor = UIColor.systemGray5
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        cell.widthAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true

        let imageView = UIImageView(image: UIImage(systemName: image))
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(imageView)
            
        let label = UILabel()
        label.text = labelText
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: cell.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -5)
        ])
        
        return cell
    }
}
