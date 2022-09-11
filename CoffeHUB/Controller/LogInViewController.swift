//
//  LogInViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit
import CoreData

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var appDelegate: AppDelegate!
    var manageObjectContext: NSManagedObjectContext!
    var coreDataArray: [NSManagedObject] = []
    var DataPersonArray: [Register] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteBorderTextField()
        self.navigationController?.isNavigationBarHidden = true
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageObjectContext = appDelegate.persistentContainer.viewContext
    }

    func deleteBorderTextField(){
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            if email.isEmpty || password.isEmpty{
                print("Complete Enter Data!")
            } else {
                fetchDataRegister()
                for item in DataPersonArray{
                    if email == item.email && password == item.password{
                        moveTOtabBar()
                    } else {
                        print("data error enter again!")
                    }
                }
            }
        }
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func moveTOtabBar(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Secound", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "tabBarID")
        vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)
    }
}
