//
//  PreferencesViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit
import SDWebImage

class PreferencesViewController: UIViewController {

    @IBOutlet weak var cartBtnOutlet: UIButton!
    @IBOutlet weak var nameCoffee: UILabel!
    @IBOutlet weak var priceCoffee: UILabel!
    @IBOutlet weak var countCoffee: UILabel!

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
    var flagNo = true
    var flagOne = true
    var flagTwo = true
    var flagThree = true
    var name = ""
    var mediumPrice = 0
    var image = ""
    var totalPrice  = 0
    var flag = 0
    var coffeeSize: CoffeeSize = .small
    var productArray : [CartModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        cartBtnOutlet.layer.cornerRadius = 25
        setDataFromMenu()
        totalPriceLabel.text = "\(Double(mediumPrice) / 2.0)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
     
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
      
        countCoffeeChoose += 1
        countCoffee.text = "\(countCoffeeChoose)"
        setTotalPrice()
    }
    
    @IBAction func decreaseBtn(_ sender: UIButton) {
        if countCoffeeChoose > 0{
            countCoffeeChoose -= 1
            countCoffee.text = "\(countCoffeeChoose)"
            setTotalPrice()
        }
    }
    
    
    @IBAction func smallCoffeeBtn(_ sender: UIButton) {
        flag = 0
        coffeeSize = .small
        flagSmall = !flagSmall
      //  if coffeeSize == .small
        if flagSmall == false {
            sender.setImage(UIImage(named: "small fill"), for: .normal)
            largeCoffeeOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
            mediumCoffeeOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
            flagMedium = true
            flagLarge = true
            flagSmall = false
            setTotalPrice()
        } else {
            sender.setImage(UIImage(named: "small fill"), for: .normal)
            largeCoffeeOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
            mediumCoffeeOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
            flagMedium = false
            flagLarge = false
            flagSmall = true
        }
    }
    
    @IBAction func mediumCoffeeBtn(_ sender: UIButton) {
        coffeeSize = .medium
        flag = 1
        flagMedium = !flagMedium
        if flagMedium == false {
            sender.setImage(UIImage(named: "m fill"), for: .normal)
            smallCoffeeOutlet.setImage(UIImage(named: "s"), for: UIControl.State.normal)
            largeCoffeeOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
            flagMedium = false
            flagLarge = true
            flagSmall = true
           setTotalPrice()
        } else {
            sender.setImage(UIImage(named: "m fill"), for: .normal)
            smallCoffeeOutlet.setImage(UIImage(named: "s"), for: UIControl.State.normal)
            largeCoffeeOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
            flagMedium = true
            flagLarge = false
            flagSmall = false
        }
    }
    
    
    @IBAction func largeCoffeeBtn(_ sender: UIButton) {
       coffeeSize = .large
        flag = 2
        flagLarge = !flagLarge
        if flagLarge == false {
            sender.setImage(UIImage(named: "L fill"), for: .normal)
            smallCoffeeOutlet.setImage(UIImage(named: "s"), for: UIControl.State.normal)
            mediumCoffeeOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
            flagMedium = true
            flagLarge = false
            flagSmall = true
            setTotalPrice()
        } else {
            sender.setImage(UIImage(named: "L fill"), for: .normal)
            smallCoffeeOutlet.setImage(UIImage(named: "s"), for: UIControl.State.normal)
            mediumCoffeeOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
            flagMedium = false
            flagLarge = true
            flagSmall = false
        }
    }
    
    
    @IBAction func noSugarBtn(_ sender: UIButton) {
        flagNo = !flagNo
        if flagNo == false {
            sender.setImage(UIImage(named: "no fill"), for: .normal)
            oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
            twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
            threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
            flagThree = true
            flagTwo = true
            flagOne = true
            flagNo = false
        } else {
            sender.setImage(UIImage(named: "no fill"), for: .normal)
            oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
            twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
            threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
            flagThree = false
            flagTwo = false
            flagOne = false
            flagNo = true
        }
    }
    
    @IBAction func oneSugarBtn(_ sender: UIButton) {
        flagOne = !flagOne
        if flagOne == false {
            sender.setImage(UIImage(named: "one fill"), for: .normal)
            noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
            twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
            threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
            flagOne = false
            flagTwo = true
            flagNo = true
            flagThree = true
        } else {
            sender.setImage(UIImage(named: "one fill"), for: .normal)
            noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
            twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
            threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
            flagOne = true
            flagNo = false
            flagTwo = false
            flagThree = false
        }
    }
    
    
    @IBAction func twoSugarBtn(_ sender: UIButton) {
        flagTwo = !flagTwo
        if flagTwo == false {
            sender.setImage(UIImage(named: "two fill"), for: .normal)
            noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
            oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
            threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
            flagTwo = false
            flagOne = true
            flagNo = true
            flagThree = true
        } else {
            sender.setImage(UIImage(named: "two fill"), for: .normal)
            noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
            oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
            threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
            flagTwo = true
            flagNo = false
            flagOne = false
            flagThree = false
        }
    }
    
    @IBAction func threeSugarBtn(_ sender: UIButton) {
        flagThree = !flagThree
        if flagThree == false {
            sender.setImage(UIImage(named: "three fill"), for: .normal)
            noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
            twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
            oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
            flagThree = false
            flagTwo = true
            flagNo = true
            flagOne = true
        } else {
            sender.setImage(UIImage(named: "three fill"), for: .normal)
            noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
            twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
            oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
            flagThree = true
            flagNo = false
            flagTwo = false
            flagOne = false
        }
    }
    
    
    @IBAction func addToCart(_ sender: UIButton) {
      print("tapeed")
      print("\(name)\(mediumPrice)")
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController{
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        countAddCart += 1
//        countOfAddToCart.text = "\(countAddCart)"
        
      let storyBoard : UIStoryboard = UIStoryboard(name: "Secound", bundle:nil)
      let vc = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
//      vc.modalPresentationStyle = .fullScreen
        
//        let objectCartModel = CartModel(nameCart: name, priceCart: "\(mediumPrice)", countCoffeeCart: countCoffee.text!, totalPriceCart: totalPriceLabel.text!)
//        productArray.append(objectCartModel)
//        vc.nameCart = name
//        vc.priceCart = "\(mediumPrice)"
//        vc.countCoffeeCart = countCoffee.text!
//        vc.totalPriceCart = totalPriceLabel.text!
        
        let objectCartModel = CartModel(nameCart: name, priceCart: "\(mediumPrice)", countCoffeeCart: countCoffee.text!, totalPriceCart: totalPriceLabel.text!, imageCart: image)
        productArray.append(objectCartModel)
        print(productArray)
        vc.cartArray = productArray
  
      self.navigationController?.pushViewController(vc, animated: true)

    }
    
  @IBAction func backToMenu(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }

    func setDataFromMenu(){
        nameCoffee.text = name
        priceCoffee.text = "\(mediumPrice) EG"
        imageCoffee.sd_setImage(with: URL(string: image), placeholderImage: nil)

    }
    
    func setTotalPrice(){
        let total = coffeeSize.getTotalPrice(price: Double(mediumPrice), countCoffee: Double(countCoffee.text!)!)
        totalPriceLabel.text = "\(total)"
    }
    
    
}
