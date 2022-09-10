//
//  ProfileViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit

class ProfileViewController: UIViewController {
  @IBOutlet weak var backScreen: UIView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var mailView: UIView!
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var phoneView: UIView!
  @IBOutlet weak var logoutButton: UIButton!
  override func viewDidLoad() {
        super.viewDidLoad()
    backScreen.dropShadow()
    mailView.dropShadow()
//    profileImage.dropShadow()
    phoneView.dropShadow()
    phoneView.layer.cornerRadius = 25
      backScreen.layer.cornerRadius = 25
       mailView.layer.cornerRadius = 25
    logoutButton.layer.cornerRadius = 25
    logoutButton.dropShadow()


      backScreen.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    profileImage.setRounded()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {

    func setRounded() {
      layer.borderWidth = 3
              layer.masksToBounds = false
              layer.borderColor = UIColor.brown.cgColor
              layer.cornerRadius = self.frame.height / 2
              clipsToBounds = true
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
