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
  //    CartData.shared.name = name
  //    CartData.shared.price = "\(mediumPrice)"
  //    CartData.shared.totalPrice = totalPriceLabel.text!
  //    CartData.shared.countCoffee = countCoffee.text!
  //    CartData.shared.image = image

  var appDelegate: AppDelegate!
  var manageObjectContext: NSManagedObjectContext!
  var price = 0.0
  var count = 0
  var total = 0.0

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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //setup()
    setupTableView()
    self.navigationController?.isNavigationBarHidden = false
  }

  override func viewWillAppear(_ animated: Bool) {
   
    setTotalPrice()
    tableView.reloadData()
  }

  private func setupTableView() {

    tableView.dataSource = self
    tableView.delegate = self

  }
  
  func setTotalPrice(){
    for item in cartNewArray{
      total += Double(item.totalPrice)!
      print("total = \(total)")
      subtotalLabel.text = "\(total) EGP"
      totalPriceLabel.text = "\(total) EGP"
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

}


extension CartViewController: CartDataProtocol {
  func add(count: Double, total: Double,price:Double) {
    totalPriceLabel.text = "\(total)"
    subtotalLabel.text = "\(total)"
  }

  func sub(count: Double, total: Double,price:Double) {
    totalPriceLabel.text = "\(total)"
    subtotalLabel.text = "\(total)"
  }
}

extension CartViewController : UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cartNewArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
    cell.count = Double(count)
    cell.total = total
    cell.cartName.text = cartNewArray[indexPath.row].name
    cell.priceLabel.text = cartNewArray[indexPath.row].price
    cell.cartImage.sd_setImage(with: URL(string: cartNewArray[indexPath.row].image), placeholderImage: nil)
    cell.quantityLabel.text = cartNewArray[indexPath.row].countCoffee
    cell.delegate = self

    return cell
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        //MARK-#update total price when delete cell
//                totalPriceLabel.text = "\(Double(totalPriceLabel.text!)! - Double(cartNewArray[indexPath.row].price)!)"

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
