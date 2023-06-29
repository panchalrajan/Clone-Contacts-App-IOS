import UIKit

class ViewUserVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let viewUserView = ViewUserView()
    var user: User

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        view.backgroundColor = .systemGray6

        let cancelButton = UIBarButtonItem(title: "Cancel",
                                           style: .plain,
                                           target: self,
                                           action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton

        let editButton = UIBarButtonItem(title : "Edit",
                                        style: .plain,
                                        target: self,
                                        action: #selector(editButtonTapped))
        navigationItem.rightBarButtonItem = editButton
        
        view.addSubview(viewUserView)
        viewUserView.tableView.dataSource = self
        viewUserView.tableView.delegate = self
        viewUserView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        viewUserView.tableView.register(MyMediumCardCell.self, forCellReuseIdentifier: "MyMediumCardCell")
        viewUserView.tableView.register(LabelAndTextCell.self, forCellReuseIdentifier: "LabelAndTextCell")
        viewUserView.tableView.register(ColoredTextCell.self, forCellReuseIdentifier: "ColoredTextCell")

        viewUserView.tableView.register(HorizontalCellsCell.self, forCellReuseIdentifier: "HorizontalCellsCell")

        viewUserView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewUserView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewUserView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewUserView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return user.phoneNumbers.count
        case 2:
            return user.emailIds?.count ?? 0
        case 3:
            return 3
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyMediumCardCell", for: indexPath) as! MyMediumCardCell
                cell.backgroundColor = .systemGray6
                cell.configure(with: "man", fullName: user.fullName, company: user.company)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalCellsCell", for: indexPath) as! HorizontalCellsCell
                cell.backgroundColor = .systemGray6
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextCell", for: indexPath) as! LabelAndTextCell
                cell.configure(headingText: "Mobile", text: "+91-8844557744")
                return cell
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextCell", for: indexPath) as! LabelAndTextCell
            if indexPath.row < user.phoneNumbers.count {
                let phoneNumber = user.phoneNumbers[indexPath.row]
                cell.configure(headingText: "Mobile \(indexPath.row + 1)", text: phoneNumber)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelAndTextCell", for: indexPath) as! LabelAndTextCell
            if indexPath.row < user.emailIds!.count {
                let emailID = user.emailIds![indexPath.row]
                cell.configure(headingText: "Email ID \(indexPath.row + 1)", text: emailID)
            }
            return cell
        case 3 :
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ColoredTextCell", for: indexPath) as! ColoredTextCell
                cell.configure(with: "Send Message", color: .systemBlue)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ColoredTextCell", for: indexPath) as! ColoredTextCell
                cell.configure(with: "Share Contact", color: .systemBlue)
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ColoredTextCell", for: indexPath) as! ColoredTextCell
                cell.configure(with: "Add to Favourite", color: .systemBlue)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
                cell.textLabel?.text = "Hello"
                return cell
            }
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColoredTextCell", for: indexPath) as! ColoredTextCell
            cell.configure(with: "Add to Emergency Contacts", color: .systemBlue)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColoredTextCell", for: indexPath) as! ColoredTextCell
            cell.configure(with: "Share My Location", color: .systemBlue)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColoredTextCell", for: indexPath) as! ColoredTextCell
            cell.configure(with: "Block this Caller", color: .systemRed)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
            cell.textLabel?.text = "Hello"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return 200
            case 1:
                return 85
            default:
                return 45
            }
        case 1:
             return 75
        case 2:
            return 75
        default :
            return 45
        }
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: true)
    }

    @objc func editButtonTapped() {

    }
}
