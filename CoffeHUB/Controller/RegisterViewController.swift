//
//  RegisterViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerBtnOutlet: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        deleteBorderTextField()
        registerBtnOutlet.layer.cornerRadius = 20
    }
    
    func deleteBorderTextField(){
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        nameTextField.borderStyle = .none
    }
  
    @IBAction func registerBtn(_ sender: UIButton) {
        goToLoginScreen()
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreferencesViewController") as? PreferencesViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func logInBtn(_ sender: UIButton) {
        goToLoginScreen()
    }
    
 
    
    func goToLoginScreen(){
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
