import UIKit

class ContactsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let contactsView = ContactsView()
    var contacts : [User] = []
    var sections = [(letter: String, users: [User])]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setModel()
        setView()
    }
    
    func setModel() {
        
        let contacts = StaticData.getUsers()

        var contactsByLetter = [String: [User]]()
        for user in contacts {
            let firstLetter = String(user.firstName.prefix(1))
            if contactsByLetter[firstLetter] == nil {
                contactsByLetter[firstLetter] = [user]
            } else {
                contactsByLetter[firstLetter]?.append(user)
            }
        }
        
        for key in contactsByLetter.keys {
            contactsByLetter[key]?.sort(by: { $0.lastName < $1.lastName })
        }

        let sortedKeys = contactsByLetter.keys.sorted()

        for key in sortedKeys {
            if let users = contactsByLetter[key] {
                sections.append((letter: key, users: users))
            }
        }
    }

    func setView() {
        self.title = "Contacts"
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true

        let groupsButton = UIBarButtonItem(title: "Groups",
                                           style: .plain,
                                           target: self,
                                           action: #selector(groupsButtonTapped))
        navigationItem.leftBarButtonItem = groupsButton

        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton

        let searchBar = UISearchController()
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false;

        view.addSubview(contactsView)
        contactsView.tableView.dataSource = self
        contactsView.tableView.delegate = self
        contactsView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactsCell")
        contactsView.tableView.register(MyCardCell.self, forCellReuseIdentifier: "CardCell")

        contactsView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contactsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contactsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count+1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return sections[section - 1].users.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! MyCardCell
            cell.configure(with: "rajan", phoneNumber: "8844557711", image: "man")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath)
            let user = sections[indexPath.section - 1].users[indexPath.row]
            cell.textLabel?.text = user.fullName
            return cell
        }
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != 0 {
            return sections[section - 1].letter
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath) is MyCardCell {
            return
        }
        let user = sections[indexPath.section - 1].users[indexPath.row]
        let viewUserVC = UINavigationController(rootViewController: ViewUserVC(user : user))
        self.present(viewUserVC, animated: true)
    }

    @objc func addButtonTapped() {
        let addUserVC = UINavigationController(rootViewController: AddUserVC())
        self.present(addUserVC, animated: true)
    }

    @objc func groupsButtonTapped() {

    }
}

