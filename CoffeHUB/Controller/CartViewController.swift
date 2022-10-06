//
//  CartViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit
import ProgressHUD
import CoreData
import SDWebImage

class CartViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var subtotalLabel: UILabel!
  @IBOutlet weak var shippingLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  
  var cartNewArray : [CoffeeCart] = []
  var coreDataCart : [NSManagedObject] = []
  var appDelegate: AppDelegate!
  var manageObjectContext: NSManagedObjectContext!
  var price = 0.0
  var count = 0
  var total = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTableView()
    setTotalPrice()
    self.navigationController?.isNavigationBarHidden = false
  }
  
  private func setupTableView() {
    
    fetchDataCart()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.reloadData()
  }
  
  func setTotalPrice(){
    for item in cartNewArray {
      total += Double(item.totalPrice)!
      print("total = \(total)")
      subtotalLabel.text = "\(total) EGP"
      totalPriceLabel.text = "\(total) EGP"
    }
  }
  
  func fetchDataCart() {
    appDelegate = UIApplication.shared.delegate as! AppDelegate
    manageObjectContext = appDelegate.persistentContainer.viewContext
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
        tableView.reloadData()
    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }
  
  public func deleteAllCoreData() {
    let allDataCart = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "CartEntity"))
    do {
      try manageObjectContext.execute(allDataCart)
    }
    catch let error as NSError{
      print(error.localizedDescription)
    }
  }
  
  @IBAction func checkoutButton(_ sender: UIButton) {
    ProgressHUD.showSuccess("Your order has been received.  ☕️")
    deleteAllCoreData()
    cartNewArray.removeAll()
    tableView.reloadData()
    subtotalLabel.text = "0.0 EGP"
    totalPriceLabel.text = "0.0 EGP"
    self.navigationController?.popToRootViewController(animated: true)
  }
  
  @IBAction func backToMenu(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
}


extension CartViewController: CartDataProtocol {
  func updateCart(count: Int, total: Double,price:Double) {
    self.count = count
    self.total = total
    setupTableView()
    subtotalLabel.text = "\(total) EGP"
    totalPriceLabel.text = "\(total) EGP"
  }
  
}

extension CartViewController : UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cartNewArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
    cell.count = Int(cartNewArray[indexPath.row].countCoffee) ?? 0
    cell.total = Double(cartNewArray[indexPath.row].totalPrice) ?? 0.0
    cell.itemCart = cartNewArray[indexPath.row]
    cell.cartName.text = cartNewArray[indexPath.row].name
    cell.priceLabel.text = cartNewArray[indexPath.row].price
    cell.cartImage.sd_setImage(with: URL(string: cartNewArray[indexPath.row].image), placeholderImage: nil)
    cell.quantityLabel.text = cartNewArray[indexPath.row].countCoffee
    cell.delegate = self
    cell.totalNow = total
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        let newTotal = total - Double(cartNewArray[indexPath.row].price)! * Double(cartNewArray[indexPath.row].countCoffee)!
        totalPriceLabel.text = "\(newTotal)"
        subtotalLabel.text = "\(newTotal)"
            cartNewArray.remove(at: indexPath.row)
            manageObjectContext.delete(coreDataCart[indexPath.row])
      do{
        try manageObjectContext.save()
      } catch let error as NSError{
        print(error.localizedDescription)
      }
      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
      
      
    }
  }
}
