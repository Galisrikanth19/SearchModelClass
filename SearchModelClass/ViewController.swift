//
//  ViewController.swift
//  SearchModelClass
//
//  Created by ELORCE INDUSTRIES PRIVATE LIMITED on 15/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFld: UITextField!
    @IBOutlet weak var tbv: UITableView!
    var allUsersArr = [ User(name: "Srikanth", email: "galiSrikanth19@gmail.com", phone: "987444540"),
                        User(name: "Saanvi", email: "Saanvi@gmail.com", phone: "987444541"),
                        User(name: "Sagarika", email: "Sagarika9@gmail.com", phone: "987444542"),
                        User(name: "Ravi", email: "galiSrikanth19@gmail.com", phone: "987444543"),
                        User(name: "dinesh", email: "dinesh@gmail.com", phone: "987444544"),
                        User(name: "sathish", email: "sathish@gmail.com", phone: "987444545"),
                        User(name: "balu", email: "balu@gmail.com", phone: "987444546"),
                        User(name: "pavan", email: "pavan@gmail.com", phone: "987444547"),
                        User(name: "meena", email: "prassu@gmail.com", phone: "987444548"),
                        User(name: "prassu", email: "meena@gmail.com", phone: "987444549")]
    
    var usersArr:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbv.backgroundColor = .clear
        tbv.separatorColor = .clear
        usersArr = allUsersArr
    }
    
    @IBAction func searchBtnClicked(_ sender: Any) {
        if let txtFldStr = txtFld.text {
            searchModelArrayWithString(strIs: txtFldStr.lowercased())
        }
    }
    
    private func searchModelArrayWithString(strIs: String) {
        let companyContainsGroup = allUsersArr.filter { user in
            if user.name.lowercased().contains(strIs) {
                return true
            } else if user.email.lowercased().contains(strIs) {
                return true
            }
            else if user.phone.contains(strIs) {
                return true
            }
            return false
        }
        
        usersArr.removeAll()
        
        if txtFld.text == "" {
            usersArr = allUsersArr
        }
        else {
            usersArr.append(contentsOf: companyContainsGroup)
        }
        
        tbv.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbvCell = tableView.dequeueReusableCell(withIdentifier: "tbvCell") as? tbvCell
        let userIs = usersArr[indexPath.row]
        tbvCell?.configureCell(user: userIs)
        return tbvCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

struct User {
    var name: String
    var email: String
    var phone: String
}

class tbvCell: UITableViewCell {
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var emailTitle: UILabel!
    @IBOutlet weak var phoneTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    func configureCell(user: User) {
        nameTitle.text = user.name
        emailTitle.text = user.email
        phoneTitle.text = user.phone
    }
}
