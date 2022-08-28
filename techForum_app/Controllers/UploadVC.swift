//
//  UploadVC.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 22.08.2022.
//

import UIKit
import Firebase

class UploadVC: UIViewController {
    @IBOutlet weak var categoryControl: UISegmentedControl!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func postButtonClicked(_ sender: Any) {
        
        let title = titleField.text ?? ""
        let description = descriptionField.text ?? ""
        let category = categoryControl.titleForSegment(at: categoryControl.selectedSegmentIndex)
        let currentUser = Auth.auth().currentUser
        
        let newPost : Dictionary<String, Any> = ["title":title,"desc": description,"category":category,"email":currentUser?.email]
        createNewPost(item: newPost)
    }
    
    func createNewPost(item: Dictionary<String, Any>){
        
        let fireBaseNewPost = DataService.dataService.item_REF.childByAutoId()
        
        fireBaseNewPost.setValue(item) { error, ref in
            
            if error != nil{
                generalFunc.showAlert(title: "Error", message: error?.localizedDescription ?? "", vc: self)
            }else{
                self.dismiss(animated: true)
                self.navigationController?.popViewController(animated: true)
                self.titleField.text = ""
                self.descriptionField.text = ""
                print("success")
            }
        }
        
    }
    
}
