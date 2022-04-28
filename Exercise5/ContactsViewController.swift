//
//  ContactsViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 27/04/2022.
//

import UIKit

class ContactsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    var searchResults : [String] = []
    var contacts : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        loadData()
        configTableView()
        configSearchBar()
        turnOffEdittingMode()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.isHidden = false
    }
    @IBAction func didTapMessage(_ sender: UIButton) {
        print("Send message")
    }
    func loadData(){
        guard let path = Bundle.main.url(forResource: "Contacts", withExtension: "plist") else {
            return
        }
        guard let contactsData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        contacts =  contactsData
        searchResults = contactsData
    }
    func configTableView(){
        tableView.register(UINib(nibName: "ContactTableViewCell",bundle: .main),
                           forCellReuseIdentifier: "ContactTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    func configSearchBar(){
        searchBar.delegate = self
    }
    func search(keyword : String){
        searchResults = getContact(keyword: keyword)
        tableView.reloadData()
    }
    func getContact(keyword : String) -> [String]{
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == ""  {
            return contacts
        }else {
            var data : [String] = []
            for contact in contacts{
                if let _ = contact.range(of: keyword){
                    data.append(contact)
                }
            }
            return data
        }
    }
    
    @objc func turnOnEdittingMode(){
        tableView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEdittingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func turnOffEdittingMode(){
        tableView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(turnOnEdittingMode))
        navigationItem.rightBarButtonItem = editButton
    }

}
// MARK: - UITableViewDatasource
extension ContactsViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < searchResults.count{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for : indexPath) as? ContactTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.updateTableViewCell(avatar: "profile", contactName: searchResults[indexPath.row] , subtitle: "Click to see detail")
            
            
//            cell.textLabel?.text = ("\(searchResults[indexPath.row])")
//            cell.imageView?.image = UIImage(named: "profile")
//            switch indexPath.row{
//            case 0 :
//                cell.accessoryType = .none
//            case 1 :
//                cell.accessoryType = .checkmark
//            case 2 :
//                cell.accessoryType = .detailButton
//            case 3 :
//                cell.accessoryType = .detailDisclosureButton
//            case 4 :
//                cell.accessoryType = .disclosureIndicator
//            default :
//                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
//                imageView.image = UIImage(named: "heart")
//                cell.accessoryView = imageView
//            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
// MARK: - UITableViewDelegate
extension ContactsViewController : UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < searchResults.count{
        tableView.deselectRow(at: indexPath, animated: true)
        let detailView =  ContactDetailView()
        detailView.configure(with: searchResults[indexPath.row])
            tableView.isHidden = true
        navigationController?.pushViewController(detailView, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let result = indexPath.row % 3
        switch result {
        case 0 : return .none
        case 1 : return .delete
        default : return .insert
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle{
        case .none :
            return
        case .delete :
            print("Delete at row \(indexPath.row)")
        case .insert :
            print("Insert at row \(indexPath.row)")
        }
    }
}

// MARK: - UISearchBarDelegate
extension ContactsViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText = ""
        if let searchBarText = searchBar.text{
            currentText = searchBarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword : keyword)
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else {
            search(keyword : "")
            return
        }
        search(keyword: keyword)
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search(keyword : "")
    }
}

extension ContactsViewController : ContactTableViewCellDelegate{
    func addToFavourite(_ contactTableViewCell: ContactTableViewCell) {
        var contactName = " "
        if let name = contactTableViewCell.nameLabel.text  {
            contactName = name
        }
        print("Added \(contactName) to favourite")
    }
    
    func makeCall(_ contactTableViewCell: ContactTableViewCell) {
        var contactName = " "
        if let name = contactTableViewCell.nameLabel.text  {
            contactName = name
        }
        print("Calling \(contactName)")
    }
}
