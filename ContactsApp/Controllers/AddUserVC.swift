import UIKit

class AddUserVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, MinusButtonWithTextFieldCellDelegate  {
    
    let addUserView = AddUserView()
    var numberOfPhoneCells : [Int] = []
    var numberOfEMailID : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    func setView() {
        self.title = "New Contact"
        view.backgroundColor = .systemGray6
        
        let cancelButton = UIBarButtonItem(title: "Cancel",
                                           style: .plain,
                                           target: self,
                                           action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton

        let doneButton = UIBarButtonItem(title : "Done",
                                        style: .plain,
                                        target: self,
                                        action: #selector(doneButtonTapped))
        doneButton.isEnabled = false
        navigationItem.rightBarButtonItem = doneButton

        view.addSubview(addUserView)
        addUserView.tableView.dataSource = self
        addUserView.tableView.delegate = self
        addUserView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        addUserView.tableView.register(MyBigCardCell.self, forCellReuseIdentifier: "BigCardCell")
        addUserView.tableView.register(PlaceHolderCell.self, forCellReuseIdentifier: "PlaceHolderCell")
        addUserView.tableView.register(AddButtonWithLabelCell.self, forCellReuseIdentifier: "AddButtonWithLabelCell")
        addUserView.tableView.register(MinusButtonWithTextFieldCell.self, forCellReuseIdentifier: "MinusButtonWithTextFieldCell")

        addUserView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addUserView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addUserView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addUserView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return numberOfPhoneCells.count + 1
        case 2:
            return numberOfEMailID.count + 1
        default:
            return 5
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "BigCardCell", for: indexPath) as! MyBigCardCell
                cell.backgroundColor = .systemGray6
                cell.configure(with: "man")
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceHolderCell", for: indexPath) as! PlaceHolderCell
                cell.textField.delegate = self
                cell.textField.tag = indexPath.row
                cell.configure(placeHolderText: "First Name")
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceHolderCell", for: indexPath) as! PlaceHolderCell
                cell.textField.delegate = self
                cell.textField.tag = indexPath.row
                cell.configure(placeHolderText: "Last Name")
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceHolderCell", for: indexPath) as! PlaceHolderCell
                cell.textField.delegate = self
                cell.textField.tag = indexPath.row
                cell.configure(placeHolderText: "Company")
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
                cell.textLabel?.text = "Hello"
                return cell
            }
        case 1:
            if indexPath.row == numberOfPhoneCells.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddButtonWithLabelCell", for: indexPath) as! AddButtonWithLabelCell
                cell.configure(with: "Add Phone")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MinusButtonWithTextFieldCell", for: indexPath) as! MinusButtonWithTextFieldCell
                cell.delegate = self
                cell.configure(placeHolderText: "Mobile")
                return cell
            }
        case 2:
            if indexPath.row == numberOfEMailID.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddButtonWithLabelCell", for: indexPath) as! AddButtonWithLabelCell
                cell.configure(with: "Add Email")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MinusButtonWithTextFieldCell", for: indexPath) as! MinusButtonWithTextFieldCell
                cell.delegate = self
                cell.configure(placeHolderText: "Mail ID")
                return cell
            }

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
            cell.textLabel?.text = "Hello"
            return cell
        }
         
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            if indexPath.row == tableView.numberOfRows(inSection: 1) - 1 {
                numberOfPhoneCells.append(1)
                addUserView.tableView.reloadData()
            }
        case 2:
            if indexPath.row == tableView.numberOfRows(inSection: 2) - 1 {
                numberOfEMailID.append(1)
                addUserView.tableView.reloadData()
            }
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 && indexPath.row == 0) {
            return 250
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard tableView.cellForRow(at: indexPath) is MinusButtonWithTextFieldCell else {
            return nil
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            if indexPath.section == 1 {
                self?.numberOfPhoneCells.remove(at: indexPath.row)
            } else {
                self?.numberOfEMailID.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeActions.performsFirstActionWithFullSwipe = true
        
        return swipeActions
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField.tag {
        case 1:
            print(text)
        case 2:
            print(text)
        case 3:
            print(text)
        default:
            break
        }
    }

    @objc func cancelButtonTapped() {
        self.dismiss(animated: true)
    }

    @objc func doneButtonTapped() {

    }
    
    func didTapMinusButton(at indexPath: IndexPath) {
        if addUserView.tableView.cellForRow(at: indexPath) is MinusButtonWithTextFieldCell {
            if let swipeActions = tableView(addUserView.tableView, trailingSwipeActionsConfigurationForRowAt: indexPath) {
                let deleteAction = swipeActions.actions[0]
                deleteAction.handler(deleteAction, addUserView.tableView, { _ in })
            }
        }
    }
}
