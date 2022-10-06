//
//  PreferencesViewController.swift
//  CoffeHUB
//
//  Created by Donia Elshenawy on 10/09/2022.
//

import UIKit
import SDWebImage
import CoreData

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
  var appDelegate: AppDelegate!
  var manageObjectContext: NSManagedObjectContext!
  var countAddCart = 0
  var countCoffeeChoose = 0
  var cartNewArray : [CoffeeCart] = []
  var coreDataCart : [NSManagedObject] = []
  var name = ""
  var mediumPrice = 0
  var image = ""
  var totalPrice  = 0
  var isSelectedSize = true
  var isSelectedSugar = true
  var coffeeSize: CoffeeSize = .small
  var coffeeSugar: CoffeeSugar = .no
  var productArray : [CartModel] = []
  var price = 0.0
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = false
    cartBtnOutlet.cornerRadius()
    setDataFromMenu()
    price = (Double(mediumPrice) / 2.0)
    totalPriceLabel.text = "\(Double(mediumPrice) / 2.0)"
    appDelegate = UIApplication.shared.delegate as! AppDelegate
    manageObjectContext = appDelegate.persistentContainer.viewContext
  }

  private func setDataFromMenu(){
    nameCoffee.text = name
    priceCoffee.text = "\(mediumPrice) EGP"
    imageCoffee.sd_setImage(with: URL(string: image), placeholderImage: nil)

  }

  private func setTotalPrice(){
    let total = coffeeSize.getTotalPrice(price: Double(mediumPrice), countCoffee: Double(countCoffee.text!)!)
      
    totalPriceLabel.text = "\(total)"
  }

  private func setImageforSmall(){
    smallCoffeeOutlet.setImage(UIImage(named: "small fill"), for: .normal)
    largeCoffeeOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
    mediumCoffeeOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
  }

  private func setImageforMeduim(){
    mediumCoffeeOutlet.setImage(UIImage(named: "m fill"), for: .normal)
    smallCoffeeOutlet.setImage(UIImage(named: "s"), for: UIControl.State.normal)
    largeCoffeeOutlet.setImage(UIImage(named: "L"), for: UIControl.State.normal)
  }

  private func setImageforLarge(){
    largeCoffeeOutlet.setImage(UIImage(named: "L fill"), for: .normal)
    smallCoffeeOutlet.setImage(UIImage(named: "s"), for: UIControl.State.normal)
    mediumCoffeeOutlet.setImage(UIImage(named: "m"), for: UIControl.State.normal)
  }

  private func setImageforNoSugar(){
    noSugarOutlet.setImage(UIImage(named: "no fill"), for: .normal)
    oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
    twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
    threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
  }

  private func setImageforOneSugar(){
    oneSugarOutlet.setImage(UIImage(named: "one fill"), for: .normal)
    noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
    twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
    threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
  }

  private func setImageforTwoSugar(){
    twoSugarOutlet.setImage(UIImage(named: "two fill"), for: .normal)
    noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
    oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
    threeSugarOutlet.setImage(UIImage(named: "three"), for: UIControl.State.normal)
  }

  private func setImageforThreeSugar(){
    threeSugarOutlet.setImage(UIImage(named: "three fill"), for: .normal)
    noSugarOutlet.setImage(UIImage(named: "noo"), for: UIControl.State.normal)
    twoSugarOutlet.setImage(UIImage(named: "two"), for: UIControl.State.normal)
    oneSugarOutlet.setImage(UIImage(named: "one"), for: UIControl.State.normal)
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
    coffeeSize = .small
    isSelectedSize = !isSelectedSize
    setImageforSmall()
      price = Double(mediumPrice) / 2.0
    if coffeeSize == .small{
      isSelectedSize = true
      setTotalPrice()
    } else {
      isSelectedSize = false
    }
  }

  @IBAction func mediumCoffeeBtn(_ sender: UIButton) {
    coffeeSize = .medium
    isSelectedSize = !isSelectedSize
    setImageforMeduim()
      price = Double(mediumPrice)
    if coffeeSize == .medium{
      isSelectedSize = true
      setTotalPrice()
    } else {
      isSelectedSize = false
    }
  }

  @IBAction func largeCoffeeBtn(_ sender: UIButton) {
    coffeeSize = .large

    isSelectedSize = !isSelectedSize
    setImageforLarge()
    price = Double(mediumPrice) * 2.0
    if coffeeSize == .large{
      isSelectedSize = true
      setTotalPrice()
    } else {
      isSelectedSize = false
    }
  }

  @IBAction func noSugarBtn(_ sender: UIButton) {
    coffeeSugar = .no
    isSelectedSugar = !isSelectedSugar
    setImageforNoSugar()
    if coffeeSugar == .no{
      isSelectedSugar = true
    } else {
      isSelectedSugar = false
    }
  }

  @IBAction func oneSugarBtn(_ sender: UIButton) {
    coffeeSugar = .one
    isSelectedSugar = !isSelectedSugar
    setImageforOneSugar()
    if coffeeSugar == .one{
      isSelectedSugar = true
    } else {
      isSelectedSugar = false
    }
  }

  @IBAction func twoSugarBtn(_ sender: UIButton) {
    coffeeSugar = .two
    isSelectedSugar = !isSelectedSugar
    setImageforTwoSugar()
    if coffeeSugar == .two{
      isSelectedSugar = true
    } else {
      isSelectedSugar = false
    }
  }

  @IBAction func threeSugarBtn(_ sender: UIButton) {
    coffeeSugar = .three
    isSelectedSugar = !isSelectedSugar
    setImageforThreeSugar()
    if coffeeSugar == .three{
      isSelectedSugar = true
    } else {
      isSelectedSugar = false
    }
  }

  @IBAction func addToCart(_ sender: UIButton) {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let vc = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
    let total = coffeeSize.getTotalPrice(price: Double(mediumPrice), countCoffee: Double(countCoffee.text!)!)
    fetchDataCart()
    if cartNewArray.contains(where: {$0.name == name && $0.type == coffeeSize.rawValue}) {
        DatabaseManger.shared.updateDataOfCart(name: name, price: "\(price)", totalPrice: "\(total)", countCoffee: countCoffee.text!, image: image, type: coffeeSize.rawValue)
    }else {
        DatabaseManger.shared.saveDataofCart(name: name, price: "\(price)", totalPrice: "\(total)", countCoffee: countCoffee.text!, image: image, type: coffeeSize.rawValue)
    }
    fetchDataCart()
    vc.coreDataCart = coreDataCart
    vc.cartNewArray = cartNewArray
    self.navigationController?.pushViewController(vc, animated: true)
  }

  @IBAction func backToMenu(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }

  func fetchDataCart() {
    cartNewArray.removeAll()
    let fetchData = NSFetchRequest<NSManagedObject>(entityName: "CartEntity")
    do{
      coreDataCart = try manageObjectContext.fetch(fetchData)
      for item in coreDataCart{
        let name = item.value(forKey: "name") as! String
        let price = item.value(forKey: "price") as! String
        let totalPrice = item.value(forKey: "totalPrice") as! String
        let countCoffee = item.value(forKey: "countCoffee") as! String
        let image = item.value(forKey: "image") as! String
        let type = item.value(forKey: "type") as! String
        let objectCoffeeCart = CoffeeCart(name: name, type: type, price: price, totalPrice: totalPrice, countCoffee: countCoffee, image: image)
        cartNewArray.append(objectCoffeeCart)
      }

    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }

}
