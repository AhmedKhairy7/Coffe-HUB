//
//  LogInViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit
import CoreData
import ProgressHUD

class LogInViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var logInOutlet: UIButton!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  let userDefaults = UserDefaults.standard
  var appDelegate: AppDelegate!
  var manageObjectContext: NSManagedObjectContext!
  var coreDataArray: [NSManagedObject] = []
  var DataPersonArray: [Register] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    gifLogin()
    deleteBorderTextField()
    logInOutlet.cornerRadius()
    self.navigationController?.isNavigationBarHidden = true
    appDelegate = UIApplication.shared.delegate as! AppDelegate
    manageObjectContext = appDelegate.persistentContainer.viewContext
  }

  private func deleteBorderTextField(){
    emailTextField.borderStyle = .none
    passwordTextField.borderStyle = .none
  }

  private func moveTOtabBar(){
    let storyBoard : UIStoryboard = UIStoryboard(name: "Secound", bundle:nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "tabBarID")
    vc.modalPresentationStyle = .fullScreen
    self.navigationController?.pushViewController(vc, animated: true)
  }

  private func gifLogin() {
    let gif = UIImage.gifImageWithName("Login")
    imageView.image = gif
  }

  private func logIn() {
    if let email = emailTextField.text, let password = passwordTextField.text{
      if email.isEmpty || password.isEmpty{
        print("Complete Enter Data !")
        ProgressHUD.showError("Complete Enter Data !")
      } else {

        //MARK: this Code for CoreData.
        //                fetchDataRegister()
        //                for item in DataPersonArray{
        //                    if email == item.email && password == item.password{
        //                      ProgressHUD.showSucceed("Welcome again 👏🏻")
        //                        moveTOtabBar()
        //                    } else {
        //                        print("data error enter again!")
        //                      ProgressHUD.showError("data error enter again !")
        //
        //                    }
        //                }


        let modelLogin = LoginModel(email: email, password: password)
        APICaller().loginUser(login: modelLogin) { result in
          switch result{
          case .success(let json):
            print(json as AnyObject)
            let emailUser = (json as AnyObject).value(forKey: "email") as! String
            let name = (json as AnyObject).value(forKey: "name") as! String
            let modelLoginResponse = LoginResponseModel(name: name, email: emailUser)
            print(modelLoginResponse)
            self.userDefaults.set(name, forKey: "name")
            self.userDefaults.set(emailUser, forKey: "emailUser")
            ProgressHUD.showSucceed("Welcome again 👏🏻")
            self.moveTOtabBar()
          case .failure(let error):
            print(error.localizedDescription)
            ProgressHUD.showError("data error enter again !")
          }
        }
      }
    }
  }

  @IBAction func loginBtn(_ sender: UIButton) {
    logIn()
  }

  @IBAction func registerBtn(_ sender: UIButton) {
    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController{
      self.navigationController?.pushViewController(vc, animated: true)

    }
  }
}

