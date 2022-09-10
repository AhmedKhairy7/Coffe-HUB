//
//  LogInViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteBorderTextField()

        self.navigationController?.isNavigationBarHidden = true
    }
    

    func deleteBorderTextField(){
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
    }
   
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
