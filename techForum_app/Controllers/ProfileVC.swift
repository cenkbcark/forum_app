//
//  ProfileVC.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 22.08.2022.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        
        navBar.topItem?.title = Auth.auth().currentUser?.email
    }
   
    @IBAction func logoutButtonClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Exit", message: "Do you want to close your session?", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.destructive, handler: { _ in
            do{
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "toBack", sender: nil)
            }catch{
                generalFunc.showAlert(title: "Error", message: "Error while exiting process", vc: self)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true)
    }
    
}
