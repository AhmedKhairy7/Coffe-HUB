//
//  RegisterViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerBtnOutlet: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var appDelegate: AppDelegate!
    var manageObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageObjectContext = appDelegate.persistentContainer.viewContext
        deleteBorderTextField()
        registerBtnOutlet.layer.cornerRadius = 20
    }
    
    func deleteBorderTextField(){
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        nameTextField.borderStyle = .none
    }
  
    @IBAction func registerBtn(_ sender: UIButton) {
        if let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text{
            if name.isEmpty || password.isEmpty || email.isEmpty{
                print("Complete Enter Data!")
            } else {
                saveDataofRegister(name: name, email: email, password: password)
                goToLoginScreen()
            }
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
