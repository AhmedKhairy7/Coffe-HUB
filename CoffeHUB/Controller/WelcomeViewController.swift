//
//  WelcomeViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var registerBtnOutlet: UIButton!

    @IBOutlet weak var loginBtnOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeCarveOfBtn()

        self.navigationController?.isNavigationBarHidden = true

    }


    @IBAction func registerBtn(_ sender: UIButton) {

    }

    @IBAction func loginBtn(_ sender: UIButton) {
        loginBtnOutlet.layer.backgroundColor = UIColor.brown.cgColor
        registerBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
       // loginBtnOutlet.setTitleColor(UIColor(named: "#8C746A"), for: .normal)
        loginBtnOutlet.setTitleColor(.red, for: .normal)
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController{
//            self.navigationController?.pushViewController(vc, animated: true)
//        }

        UIButton.animate(withDuration: 1000, animations: { [self] in
            loginBtnOutlet.layer.backgroundColor = UIColor.brown.cgColor
            loginBtnOutlet.layer.backgroundColor = UIColor.brown.cgColor
            registerBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
            loginBtnOutlet.setTitleColor(.white, for: .normal)
        })


//                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController{
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
    }

    func changeCarveOfBtn(){
        registerBtnOutlet.layer.cornerRadius = 30
        loginBtnOutlet.layer.cornerRadius = 30
        registerBtnOutlet.layer.borderColor = UIColor.brown.cgColor
        loginBtnOutlet.layer.borderColor = UIColor.brown.cgColor
        registerBtnOutlet.layer.borderWidth = 1
        loginBtnOutlet.layer.borderWidth = 1
    }

}
