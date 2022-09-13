//
//  CartViewController.swift
//  CoffeHUB
//
//  Created by AhmedKhairy on 10/09/2022.
//

import UIKit
import ProgressHUD

class CartViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var subtotalLabel: UILabel!
  @IBOutlet weak var shippingLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  var nameCart = ""
  var priceCart = ""
  var countCoffeeCart = ""
   var totalPriceCart = ""
  @IBAction func checkoutButton(_ sender: UIButton) {

  ProgressHUD.showSuccess("Your order has been received.  ☕️")
  }
  @IBAction func backToMenu(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
    setup()
    setupTableView()
    self.navigationController?.isNavigationBarHidden = false

 }
func setup() {
  subtotalLabel.text = totalPriceCart
  totalPriceLabel.text = "\(totalPriceCart) EG"

}
private func setupTableView() {

  tableView.dataSource = self
  tableView.delegate = self

}
}

