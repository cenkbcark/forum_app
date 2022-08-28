//
//  ViewController.swift
//  techForum_app
//
//  Created by Cenk Bahadır Çark on 21.08.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singInClicked(_ sender: Any) {
        
        let username = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if password.isEmpty || username.isEmpty {
            
            generalFunc.showAlert(title: "Error", message: "Please enter your email and password", vc: self)
            return
        }else{
            Auth.auth().signIn(withEmail: username, password: password){(result, error) in
                
                if error != nil{
                    generalFunc.showAlert(title: "Error", message: "Please check your email and password", vc: self)
                }else{
                    self.dismiss(animated: true)
                    self.performSegue(withIdentifier: "toLogin", sender: nil)
                }
            }
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
}

