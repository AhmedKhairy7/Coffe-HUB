//
//  RegisterViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit
import CoreData
import ProgressHUD

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
        registerBtnOutlet.cornerRadius()
    }
    
    func deleteBorderTextField(){
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        nameTextField.borderStyle = .none
    }

    func goToLoginScreen(){
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController{
          self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveTOtabBar(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Secound", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "tabBarID")
        vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    }

       private func register() {
        if let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text{
            if name.isEmpty || password.isEmpty || email.isEmpty{
                ProgressHUD.showError("Complete Enter Data !")
            } else {
                //MARK: This code fore CoreData
            // saveDataofRegister(name: name, email: email, password: password)
                let modelRegister = Register(name: name, email: email, password: password)
              APICaller().createUser(register: modelRegister) { isSuccess, stringMessage in
                    if isSuccess{
                        ProgressHUD.showSuccess(stringMessage)
                      ProfileData.shared.name = name
                      ProfileData.shared.email = email
                        self.moveTOtabBar()
                    } else {
                        ProgressHUD.showError(stringMessage)
                    }
                }
            }
        }
    }

  @IBAction func registerBtn(_ sender: UIButton) {
    register()
  }
  @IBAction func logInBtn(_ sender: UIButton) {
      goToLoginScreen()
   }
 }

