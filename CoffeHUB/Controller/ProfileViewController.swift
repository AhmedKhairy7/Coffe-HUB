//
//  ProfileViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit

class ProfileViewController: UIViewController {
  @IBOutlet weak var profileView: UIView!
  @IBOutlet weak var mailLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var mailView: UIView!
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var phoneView: UIView!
  @IBOutlet weak var logoutButton: UIButton!
  
  @IBAction func logoutButton(_ sender: UIButton) {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "LogInViewController")
    vc.modalPresentationStyle = .fullScreen
  self.navigationController?.pushViewController(vc, animated: true)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    
    
  }
  
  private func setupUI() {
    
    mailView.dropShadow()
    phoneView.dropShadow()
    phoneView.layer.cornerRadius = 25
    mailView.layer.cornerRadius = 25
    logoutButton.layer.cornerRadius = 20
    logoutButton.dropShadow()
    profileImage.cornerRadius()
    
    
  }
  
  
}


