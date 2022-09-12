//
//  PreferencesViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var cartBtnOutlet: UIButton!
    @IBOutlet weak var nameCoffee: UILabel!
    @IBOutlet weak var priceCoffee: UILabel!
    @IBOutlet weak var countCoffee: UILabel!
    @IBOutlet weak var countOfAddToCart: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var smallCoffeeOutlet: UIButton!
    @IBOutlet weak var mediumCoffeeOutlet: UIButton!
    @IBOutlet weak var largeCoffeeOutlet: UIButton!
    @IBOutlet weak var noSugarOutlet: UIButton!
    @IBOutlet weak var oneSugarOutlet: UIButton!
    @IBOutlet weak var twoSugarOutlet: UIButton!
    @IBOutlet weak var threeSugarOutlet: UIButton!
    @IBOutlet weak var imageCoffee: UIImageView!
    var countAddCart = 0
    var countCoffeeChoose = 0
    var flagSmall = true
    var flagMedium = true
    var flagLarge = true
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        cartBtnOutlet.layer.cornerRadius = 25
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
            countCoffeeChoose += 1
            countCoffee.text = "\(countCoffeeChoose)"
    }
    
    @IBAction func decreaseBtn(_ sender: UIButton) {
        if countCoffeeChoose > 0{
            countCoffeeChoose -= 1
            countCoffee.text = "\(countCoffeeChoose)"
        }
    }
    
    
    @IBAction func smallCoffeeBtn(_ sender: UIButton) {
//        flagSmall = !flagSmall
//        if flagSmall == false {
//            print(flagSmall)
//            sender.setImage(UIImage(named: "small fill"), for: .normal)
//            lBtnOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
//            mBtnOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
//            flagMedium = true
//            flagLarge = true
//            flagSmall = false
//        } else {
//            print(flagSmall)
//            sender.setImage(UIImage(named: "s"), for: .normal)
//            lBtnOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
//            mBtnOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
//            flagMedium = false
//            flagLarge = false
//            flagSmall = true
//        }
    }
    
    @IBAction func mediumCoffeeBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func largeCoffeeBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func noSugarBtn(_ sender: UIButton) {
    }
    
    @IBAction func oneSugarBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func twoSugarBtn(_ sender: UIButton) {
    }
    
    @IBAction func threeSugarBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func addToCart(_ sender: UIButton) {
      print("tapeed")
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController{
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        countAddCart += 1
//        countOfAddToCart.text = "\(countAddCart)"
        
      let storyBoard : UIStoryboard = UIStoryboard(name: "Secound", bundle:nil)
      let vc = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
//      vc.modalPresentationStyle = .fullScreen
      self.navigationController?.pushViewController(vc, animated: true)

    }
    
  @IBAction func backToMenu(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }

}
