//
//  CartViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit
import ProgressHUD
import CoreData

class CartViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var subtotalLabel: UILabel!
  @IBOutlet weak var shippingLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!

    var cartArray : [CartModel] = []
    var cartNewArray : [CoffeeCart] = []
    var coreDataCart : [NSManagedObject] = []
    var appDelegate: AppDelegate!
    var manageObjectContext: NSManagedObjectContext!
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
      print("cartArray=\(cartArray)")
      appDelegate = UIApplication.shared.delegate as! AppDelegate
      manageObjectContext = appDelegate.persistentContainer.viewContext
 }

    override func viewWillAppear(_ animated: Bool) {
        
        fetchDataCart()
        setTotalPrice()
        tableView.reloadData()
    }
private func setupTableView() {

  tableView.dataSource = self
  tableView.delegate = self

}
  
    func setTotalPrice(){
        total = 0.0
        for item in cartNewArray{
            total += Double(item.totalPrice)!
            print("total = \(total)")
            subtotalLabel.text = "\(total) EGP"
            totalPriceLabel.text = "\(total) EGP"
        }
    }
    
    
    public func deleteAllCoreData(){
        let allDataCart = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "CartEntity"))
        do {
            try manageObjectContext.execute(allDataCart)
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}


extension CartViewController: CartDataProtocol{
    func add(count: String, total: String) {
        let price = CartData.shared.price ?? "0.0"
        let t = Double(total)! + Double(price)!
        totalPriceLabel.text = "\(t)"
        subtotalLabel.text = "\(t)"
    }
    
    func sub(count: String, total: String) {
        let price = CartData.shared.price ?? "0.0"
        let count = CartData.shared.countCoffee ?? "0"
        let t = Double(total)! - Double(price)!
        totalPriceLabel.text = "\(t)"
        subtotalLabel.text = "\(t)"
    }
}
