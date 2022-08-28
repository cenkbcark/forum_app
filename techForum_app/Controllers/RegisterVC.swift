//
//  RegisterVC.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 22.08.2022.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    @IBOutlet weak var repasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emalTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        let username = emalTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let repassword = repasswordTextField.text ?? ""
        
        if username.isEmpty || password.isEmpty || repassword != password {
            
            generalFunc.showAlert(title: "Error", message: "Please enter email and password!", vc: self)
            return
        }else{
            createUser(email: username, password: password)
        }
        
        
    }
    func createUser(email: String, password: String){
        
        Auth.auth().createUser(withEmail: email, password: password){(result, error) in
            if error != nil{
                generalFunc.showAlert(title: "Error", message: error?.localizedDescription ?? "", vc: self)
            }else{
                let alert = UIAlertController(title: "Success", message: "Your account has been created!", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ in
                    _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(okButton)
                self.present(alert,animated: true)
            }
        }
        
    }
}
