//
//  LoginController.swift
//  CarRentalApp
//
//  Created by Uzeyir on 21.10.23.
//

import UIKit

class LoginController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        guard let email = usernameTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            
            showError(message: "E-poct ve Sifre bosdur")
            return
        }
        
        let controller2 = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        
        self.present(controller2, animated: true)
        
    
        if isValidLogin(email: email, password: password) {
            
            let controller2 = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let countryViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
             self.navigationController?.pushViewController(countryViewController, animated: true)
              } else {
            
            showError(message: "Hesabiniz tapilmadi")
        }
    }
    func showError(message: String) {
        usernameTextField.text = message
        passwordTextField.isHidden = false
    }
    
    
    func isValidLogin(email: String, password: String) -> Bool {
        
        if email == "uzeyir77@gmail.com" && password == "password3" {
            return true
        } else {
            return false
        }
    }
        
}
    


