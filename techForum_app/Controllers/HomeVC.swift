//
//  HomeVC.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 22.08.2022.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var items = [itemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        getAllData()
    }
    override func viewWillAppear(_ animated: Bool) {
        getAllData()
    }
    func getAllData(){
        
        DataService.dataService.item_REF.observe(.value, with: {(snapshot: DataSnapshot?) in
        
            if let snapshot = snapshot?.children.allObjects as? [DataSnapshot] {
                self.items.removeAll()
                
                for snap in snapshot{
                    
                    if let postDic = snap.value as? Dictionary<String, AnyObject> {
                        
                        let items = itemModel(key: snap.key, dictionary: postDic)
                        
                        self.items.insert(items, at: 0)
                    }
                        
                }
                self.tableView.reloadData()
            }
        })
    }
    
    @objc func delButton(sender: UIButton){
        
        print(sender.tag)
        deleteItem(item: self.items[sender.tag])
    }
    func deleteItem(item: itemModel){
        DataService.dataService.item_REF.child(item.key).removeValue{(error, ref)in
            if error != nil{
                generalFunc.showAlert(title: "Error", message: "Post could not be deleted", vc: self)
            }else{
                generalFunc.showAlert(title: "Success", message: "Post has been deleted!", vc: self)
            }
        }
    }
    func checkUserFor(email: String) -> Bool{
        let currentUser = Auth.auth().currentUser
        return email == currentUser?.email
    }
    

 

}
extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        let item = items[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.categoryLabel.text = item.category
        cell.descLabel.text = item.desc
        cell.usernameLabel.text = "By: \(item.email)"
        
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(delButton), for: .touchUpInside)
        cell.deleteButton.isHidden = !checkUserFor(email: item.email)
        return cell
    }
    
}
